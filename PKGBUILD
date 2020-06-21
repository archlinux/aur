# Maintainer: Cody Bond <cbbond@outlook.com>

pkgname=newsie
pkgver=1.1
pkgrel=1
pkgdesc="A command line utility for accessing Arch newsfeed posts."
arch=("x86_64")
url="https://github.com/cbbond/$pkgname-go"
license=('MIT')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/cbbond/$pkgname-golang/archive/v$pkgver.tar.gz")
md5sums=('e3a1b94cb342bdf76b2aba542ef147e6')

build() {
    export GOPATH="$srcdir"/gopath
    export GO111MODULE=on
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    
    cd "$pkgname-golang-$pkgver"
    go get
    go build newsie.go
    go clean -modcache
}

package() {
    cd "$srcdir/$pkgname-golang-$pkgver"

    install -Dm 0755 $pkgname -t $pkgdir/usr/bin/
    install -Dm 0644 $pkgname.hook -T $pkgdir/usr/share/libalpm/hooks/00-$pkgname.hook
    install -Dm 0644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
