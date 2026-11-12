# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Noel Kuntze <noel.kuntze at thermi dot consulting>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de

pkgname=pdfcpu
pkgver=0.16.4
pkgrel=1
pkgdesc='A PDF processor written in Go.'
arch=(x86_64)
url='https://github.com/pdfcpu/pdfcpu'
license=('Apache-2.0')
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('fabe66144939ef8df6a7b8dd645ada74a96168cf912ced649b76ff371c741ec395b97900546c1d2c570c1f49ed84f1411abcca8484726274931e2aded82e9b70')

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
