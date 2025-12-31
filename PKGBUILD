# Maintainer: dxmoc <dxmoc@users.noreply.github.com>
pkgname=aniworld-cli
pkgver=1.0.0
pkgrel=2
pkgdesc='CLI tool to browse and watch anime from aniworld.to'
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f8663bff17e079879ce77aabc19a0c28b1241b4536128c72f7312649e22a3a7d')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Patch LIB_DIR to use system path
    sed -i 's|LIB_DIR="\$SCRIPT_DIR/lib"|LIB_DIR="/usr/share/aniworld-cli/lib"|' aniworld-cli

    install -Dm755 aniworld-cli "${pkgdir}/usr/bin/aniworld-cli"

    install -dm755 "${pkgdir}/usr/share/${pkgname}/lib"
    install -Dm644 lib/*.sh "${pkgdir}/usr/share/${pkgname}/lib/"
    install -Dm644 lib/*.js "${pkgdir}/usr/share/${pkgname}/lib/"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
