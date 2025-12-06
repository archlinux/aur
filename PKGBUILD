pkgname=yay-gui-manager-git
_pkgname=yay-gui-manager
pkgver=0
pkgrel=1
pkgdesc="Graphical interface for the yay AUR helper"
arch=('any')
url="https://github.com/ahmoodio/yay-gui-manager"
license=('MIT')
depends=('python' 'python-pyqt5' 'yay')
makedepends=('git')
provides=('yay-gui-manager')
conflicts=('yay-gui-manager')

source=(
  "git+https://github.com/ahmoodio/yay-gui-manager.git"
  "yay-gui.desktop"
  "yay-gui.png"
)

sha256sums=(
  'SKIP'  # git source
  'SKIP'  # yay-gui.desktop
  'SKIP'  # yay-gui.png
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Python + PyQt5 app, nothing to compile
  return 0
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Main executable
  install -Dm755 "yay_gui.py" \
    "${pkgdir}/usr/bin/yay-gui-manager"

  # Desktop entry (from AUR repo)
  install -Dm644 "${srcdir}/yay-gui.desktop" \
    "${pkgdir}/usr/share/applications/yay-gui.desktop"

  # Icon (from AUR repo)
  install -Dm644 "${srcdir}/yay-gui.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/yay-gui.png"

  # License
  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
