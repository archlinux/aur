# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Noel Kuntze <noel.kuntze at thermi dot consulting>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de

pkgname=pdfcpu
pkgver=0.4.2
pkgrel=1
pkgdesc='A PDF processor written in Go.'
arch=(x86_64)
url='https://github.com/hhrutter/pdfcpu'
license=('Apache')
conflicts=(pdfcpu-git)
makedepends=(go)
source=($url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('83b640f2be3ce588d59783215e80ebd6fdb27d89744d9adb86b346463881060ab88c1a6e147067e71b83309c9a87bc248b5017cc2f9343ec57253ede2f3fd4b1')

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
