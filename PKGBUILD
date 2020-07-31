# Maintainer: Cody Bond <cbbond@outlook.com>

pkgname=newsie
pkgver=1.1.1
pkgrel=1
pkgdesc="A command line utility for accessing Arch newsfeed posts."
arch=("x86_64")
url="https://github.com/cbbond/$pkgname"
license=('MIT')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/cbbond/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('0bcf1aff75f8dbdb09191b9f5c5e6b8c')

build() {
    export GOPATH="$srcdir"/gopath
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    
    cd "$srcdir/$pkgname-$pkgver"
    make
    go clean -modcache
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 0755 $pkgname -t $pkgdir/usr/bin/
    install -Dm 0644 $pkgname.hook -T $pkgdir/usr/share/libalpm/hooks/00-$pkgname.hook
    install -Dm 0644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
