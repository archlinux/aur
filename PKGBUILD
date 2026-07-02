# Contributor: Lex Black <autumn-wind@web.de>

pkgname=opencloud-web
pkgver=7.1.3
pkgrel=1
pkgdesc="Web UI for OpenCloud"
url="https://github.com/opencloud-eu/web"
arch=('aarch64' 'x86_64')
license=('AGPL-3.0-only')
makedepends=('git' 'pnpm')
install="opencloud-web.install"
backup=("var/lib/opencloud-web/config.json")
source=("${pkgname}::git+https://github.com/opencloud-eu/web.git#tag=v${pkgver/_/-}"
        "config.json")
sha512sums=('734820d2e6e4b70888bc3648c16f31f396b06e1dcb92953218300686d071c4a38a18518722eaf201e463b2092a061b0af48be60f39ed1d738c897e9ea8373df8'
            'c3692ff7d3f42af2c42d97d633cd14094c3b6421099b7eb74372ba9959ceca95f69c38da679b908802b7b5a5c2199484bb42ddc028e9e1372fb040fe51683e27')


build() {
    make -C ${pkgname} -j1 -f Makefile.release build
}

package() {
    # Base install location
    install -vdm755 "${pkgdir}/var/lib/${pkgname}"

    # Copy the created files from dist directory
    cp -rv ${pkgname}/dist/* "${pkgdir}/var/lib/${pkgname}"

    # Install custom web-ui config
    install -vm644 "${srcdir}/config.json" "${pkgdir}/var/lib/${pkgname}"
}
