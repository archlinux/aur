# Maintainer: loss
# Contributor: Claude Code <claude-code@anthropic.com>
pkgname=aghub-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="One hub for every AI coding agent - unified configuration management for 22+ assistants"
arch=('x86_64')
url="https://github.com/AkaraChen/aghub"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('aghub' 'agentctl')
conflicts=('aghub')
options=('!strip' '!debug')
source=("https://github.com/AkaraChen/aghub/releases/download/v${pkgver}/aghub_${pkgver}_amd64.deb"
        "https://github.com/AkaraChen/aghub/releases/download/v${pkgver}/agentctl-x86_64-unknown-linux-gnu.tar.gz"
        "aghub.desktop")
sha256sums=('57906a8036d9b8be1c326fead4556769a6c42376121f40729365200d1658e611'
            '9fdb35fdd4acd16ba4169ee6b097fa858a5238eae61d42f8daabbe7cf69fdc20'
            'c757f3e63c64ac773c4693804e5710b66d280ea7e07eafa3a0ef384245a4375c')

package() {
    cd "${srcdir}"

    # Extract deb data
    bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}/"

    # CLI
    install -Dm755 agentctl -t "${pkgdir}/usr/bin/"

    # Use our improved desktop entry
    install -Dm644 aghub.desktop "${pkgdir}/usr/share/applications/aghub.desktop"
}
