# Maintainer: Tommaso Sardelli <lacapannadelloziotom [AT] gmail [DOT] com>
pkgname=go-jsonnet
_basepkgname=jsonnet
pkgver=0.18.0
pkgrel=1
pkgdesc="An implementation of Jsonnet in pure Go"
arch=("x86_64")
url="https://jsonnet.org/"
license=("Apache")
makedepends=("go")
conflicts=('jsonnet' 'go-jsonnet-git')
provides=('jsonnet')
source=("${pkgname}_v${pkgver}.tar.gz::https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('aac8a2da8d939cb88389d56a8e4d4c2c1d0ab8b0284d0c35158bf3d9e52ecf2ddd357d7ba05b2db90f24c7a93bb4c0c172611199f6245eb1829537b5844aefa0')

prepare() {
    export GOPATH="${srcdir}"
    export PATH="$PATH:$GOPATH/bin"
    cd "${srcdir}/${pkgname}-${pkgver}"
    go mod download
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  go build ./cmd/jsonnet
  go build ./cmd/jsonnetfmt
  go build ./cmd/jsonnet-deps
  go build ./cmd/jsonnet-lint
}


package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 jsonnet "$pkgdir/usr/bin/jsonnet"
  install -Dm755 jsonnetfmt "$pkgdir/usr/bin/jsonnetfmt"
  install -Dm755 jsonnet-deps "$pkgdir/usr/bin/jsonnet-deps"
  install -Dm755 jsonnet-lint "$pkgdir/usr/bin/jsonnet-lint"
}
