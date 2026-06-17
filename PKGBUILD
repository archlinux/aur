# Maintainer: Fabian Berg <fabian.berg@hb9hil.org>
pkgname=mtban
pkgver=1.1.4
pkgrel=1
pkgdesc='MikroTik address-list manager via RouterOS REST API'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/hb9hil/mtban'
license=('MIT')
makedepends=('go')
conflicts=('mtban-bin')
backup=('etc/mtban/mtban.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hb9hil/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('736fbac697ad117dab48b4983f7710a85b55b54ea4f9db765dbec5c78adf436e')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    go build -trimpath -ldflags '-s -w' -o dist/mtban .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 dist/mtban             "${pkgdir}/usr/bin/mtban"
    install -Dm644 mtban.1                "${pkgdir}/usr/share/man/man1/mtban.1"
    install -Dm600 mtban.conf.example     "${pkgdir}/etc/mtban/mtban.conf"
    install -Dm644 LICENSE                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
