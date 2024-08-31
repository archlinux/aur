# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Noel Kuntze <noel.kuntze at thermi dot consulting>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de

pkgname=pdfcpu
pkgver=0.8.1
pkgrel=1
pkgdesc='A PDF processor written in Go.'
arch=(x86_64)
url='https://github.com/hhrutter/pdfcpu'
license=('Apache')
makedepends=(go)
source=($url/archive/v$pkgver.tar.gz)
b2sums=('5093c1c33fdc1e749758919f36e24100fb666cf57e532efe3e8c595ce3bf23cd8cc24ddab6b986ae71f69dc3d225a4f33686dda9d67cc74c2895e792d6fb6a48')

build() {
    cd $pkgname-$pkgver/cmd/pdfcpu
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -buildvcs=false
}

check() {
    cd $pkgname-$pkgver
    ./coverage.sh
}

package() {
    cd $pkgname-$pkgver/cmd/pdfcpu
    install -Dm755 pdfcpu "$pkgdir/usr/bin/$pkgname"
}
