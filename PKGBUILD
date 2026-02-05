# Maintainer: dxmoc <dxmoc@users.noreply.github.com>
pkgname=aniworld-cli
pkgver=1.1.0
pkgrel=1
pkgdesc='CLI tool to browse and stream anime from aniworld.to'
arch=('any')
url='https://github.com/dxmoc/aniworld-cli'
license=('GPL-3.0-or-later')
depends=('bash' 'curl' 'sed' 'grep' 'fzf' 'nodejs')
optdepends=(
    'mpv: video playback (recommended)'
    'vlc: alternative video player'
    'yt-dlp: enhanced video extraction'
    'jq: better JSON parsing'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    sed -i 's|LIB_DIR="\$SCRIPT_DIR/lib"|LIB_DIR="/usr/share/aniworld-cli/lib"|' aniworld-cli

    install -Dm755 aniworld-cli "${pkgdir}/usr/bin/aniworld-cli"

    install -dm755 "${pkgdir}/usr/share/${pkgname}/lib"
    install -Dm644 lib/*.sh "${pkgdir}/usr/share/${pkgname}/lib/"
    install -Dm755 lib/*.js "${pkgdir}/usr/share/${pkgname}/lib/"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
