# Maintainer: fk29g <fk29g.uphill912@slmails.com>
# Contributor: Bart Libert <bart plus aur at libert dot email>
pkgname=hours
pkgver=0.6.0
pkgrel=1
pkgdesc='A no-frills time tracking toolkit for command line nerds'
arch=('x86_64')
url='https://tools.dhruvs.space/hours/'
license=('MIT')
makedepends=('go')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dhth/hours/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a8d3f86e9bd4040205324067f72d68e1f3231635ae2558a056605cc64b8f23c639ebaca7224bd9a75df6a66afbacdc0c0fff3470da96f3cabc8f3f3c3c02df70')

prepare(){
    cd "$pkgname-$pkgver"
    mkdir -p build/
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
