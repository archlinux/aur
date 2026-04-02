# Maintainer: loss
# Contributor: Claude Code <claude-code@anthropic.com>
pkgname=aghub-bin
pkgver=1.0.2
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
sha256sums=('a043d3539db33cd736f4b7c3f2790e07016641c42eb86f68a2319d370752fdb5' '0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5' 'c757f3e63c64ac773c4693804e5710b66d280ea7e07eafa3a0ef384245a4375c')

package() {
    cd "${srcdir}"

    # Extract deb data
    bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}/"

    # CLI
    install -Dm755 agentctl -t "${pkgdir}/usr/bin/"

    # Use our improved desktop entry
    install -Dm644 aghub.desktop "${pkgdir}/usr/share/applications/aghub.desktop"
}
