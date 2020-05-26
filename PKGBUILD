# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=penlog
pkgver=0.1.0
pkgrel=1
pkgdesc="Tooling around the penlog logging format"
arch=('x86_64')
url='https://github.com/Fraunhofer-AISEC/penlog'
license=('GPL')
makedepends=('go' 'asciidoctor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fraunhofer-AISEC/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('49bbacce09a32cd9c66e8054374456adbc79b8592312f82dda519238c1607bcf')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    make hr man
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 "man/hr.1" "${pkgdir}/usr/share/man/man1/hr.1"
    install -Dm644 "man/penlog.7" "${pkgdir}/usr/share/man/man7/penlog.7"
    install -Dm755 hr "${pkgdir}/usr/bin/hr"
}
