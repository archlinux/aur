# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='tmuxft-git'
pkgver=0
pkgrel=1
pkgdesc="integrate Tmux with F(FileManager) & T(TermianlEditor) (Github version)"
arch=('any')
url="https://github.com/LinArcX/TmuxFT"
license=('GPL-3.0')
depends=('xdotool' 'wmctrl')
makedepends=('git')
source=("${pkgname}::git+https://github.com/LinArcX/TmuxFT")
# source=("/mnt/D/Document/WorkSpace/Packages/AUR/tmuxftt/TmuxFT.tar.gz")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    cd "${srcdir}"
    chmod +x TmuxFTDir.sh
    chmod +x TmuxFTFile.sh
}

package() {
  cd "${srcdir}"
  install -Dm755 ./TmuxFTDir.sh ${pkgdir}/usr/bin/TmuxFTDir.sh
  install -Dm755 ./TmuxFTFile.sh ${pkgdir}/usr/bin/TmuxFTFile.sh

  install -Dm755 ./TmuxFTDir.nemo_action ${pkgdir}/usr/share/nemo/actions/TmuxFTDir.nemo_action
  install -Dm755 ./TmuxFTFile.nemo_action ${pkgdir}/usr/share/nemo/actions/TmuxFTFile.nemo_action

  install -Dm644 ./tmuxft-dir.png ${pkgdir}/usr/share/icons/tmuxft-dir.png
  install -Dm644 ./tmuxft-file.png ${pkgdir}/usr/share/icons/tmuxft-file.png

  install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/TmuxFT/LICENSE
}
