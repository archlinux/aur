# Maintainer: Tharre <tharre3@gmail.com>

pkgname=age
_pkgver=1.0.0-beta2
pkgver=1.0.0beta2
pkgrel=1
pkgdesc="A simple, modern and secure file encryption tool"
arch=('x86_64')
url="https://github.com/FiloSottile/age"
license=('BSD')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FiloSottile/age/archive/v${_pkgver}.tar.gz")
sha256sums=('ca0fcfe45415c03c637c2332231f1793bf4dbd6a03e663a71ef2b7554647d763')

build() {
    cd ${pkgname}-${_pkgver}
    go build \
      -trimpath \
      -ldflags "-extldflags $LDFLAGS" \
      -o . ./...
}

package() {
    cd ${pkgname}-${_pkgver}

    install -Dm755 age age-keygen -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

check() {
    cd ${pkgname}-${_pkgver}
    go test ./...
}
