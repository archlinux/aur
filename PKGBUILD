# Maintainer: Fabian Berg <fabian.berg@hb9hil.org>
pkgname=mtban
pkgver=1.1.2
pkgrel=1
pkgdesc='MikroTik address-list manager via RouterOS REST API'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/hb9hil/mtban'
license=('MIT')
makedepends=('go')
conflicts=('mtban-bin')
backup=('etc/mtban/mtban.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hb9hil/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('05fa220ae7505f8d1db96df530d3fc865cdbfdfb15ee10f6325e53f437b0687d')

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
