# Maintainer: dxmoc <dxmoc@users.noreply.github.com>
pkgname=aniworld-cli-git
pkgver=r1.0.0
pkgrel=2
pkgdesc='CLI tool to browse and watch anime from aniworld.to (development version)'
arch=('any')
url='https://github.com/dxmoc/aniworld-cli'
license=('GPL')
depends=('bash' 'curl' 'sed' 'grep' 'fzf' 'nodejs')
optdepends=(
    'mpv: video playback (recommended)'
    'vlc: alternative video player'
    'yt-dlp: enhanced video extraction'
    'aria2: download support'
)
makedepends=('git')
provides=('aniworld-cli')
conflicts=('aniworld-cli')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    # Patch LIB_DIR to use system path
    sed -i 's|LIB_DIR="\$SCRIPT_DIR/lib"|LIB_DIR="/usr/share/aniworld-cli/lib"|' aniworld-cli

    install -Dm755 aniworld-cli "${pkgdir}/usr/bin/aniworld-cli"

    install -dm755 "${pkgdir}/usr/share/aniworld-cli/lib"
    install -Dm644 lib/*.sh "${pkgdir}/usr/share/aniworld-cli/lib/"
    install -Dm644 lib/*.js "${pkgdir}/usr/share/aniworld-cli/lib/"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/aniworld-cli/README.md"
}
