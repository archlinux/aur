# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Noel Kuntze <noel.kuntze at thermi dot consulting>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de

pkgname=pdfcpu
pkgver=0.3.13
pkgrel=1
pkgdesc='A PDF processor written in Go.'
arch=(x86_64)
url='https://github.com/hhrutter/pdfcpu'
license=('Apache')
conflicts=(pdfcpu-git)
makedepends=(go)
source=($url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('90ae1a776d597f49e5f6a39dc5c4b46830b93713c4782737486d273097d2118fccd1274eb517d468cffb92adfc4f0e6685bb75d3dc59c5696c2de332954cfda1')

build() {
    cd $pkgname-$pkgver/cmd/pdfcpu
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -buildvcs=false
}

package() {
    cd $pkgname-$pkgver/cmd/pdfcpu
    install -Dm755 pdfcpu "$pkgdir/usr/bin/$pkgname"
}
