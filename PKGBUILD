# Maintainer: Patrick Jaja <patrick.jaja@valantic.com>
# Contributor: Nayrosk

pkgname=claude-cowork-service
pkgver=1.0.50
pkgrel=1
pkgdesc="Native Linux backend for Claude Desktop Cowork"
arch=('x86_64' 'aarch64')
url="https://github.com/patrickjaja/claude-cowork-service"
license=('MIT')

depends=('systemd' 'util-linux')
optdepends=('claude-desktop-bin: Unofficial Linux frontend for Claude Desktop Cowork'
            'claude-code: An agentic coding tool that lives in your terminal (you can also install via native installer)')
makedepends=('go')

install="${pkgname}.install"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3565ccd0fe5a0d81c4863ce58aaeedf45a659e846e57de11c25de7e08f196989')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make VERSION="${pkgver}"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 cowork-svc-linux \
        "${pkgdir}/usr/bin/cowork-svc-linux"

    install -Dm644 claude-cowork.service \
        "${pkgdir}/usr/lib/systemd/user/claude-cowork.service"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
