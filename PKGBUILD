# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Noel Kuntze <noel.kuntze at thermi dot consulting>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de

pkgname=pdfcpu
pkgver=0.4.0
pkgrel=1
pkgdesc='A PDF processor written in Go.'
arch=(x86_64)
url='https://github.com/hhrutter/pdfcpu'
license=('Apache')
conflicts=(pdfcpu-git)
makedepends=(go)
source=($url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('c99b9d175b92874fac86837c39c2b71894a40c9c39ce33c8ff63321c85ae54ece96757689a896a117ec3d54b19074b7b5825f9e5246102f00515c7ee1500d188')

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
