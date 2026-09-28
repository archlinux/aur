# Maintainer: Tommaso Sardelli <lacapannadelloziotom [AT] gmail [DOT] com>
pkgname=go-jsonnet
_basepkgname=jsonnet
pkgver=0.22.0
pkgrel=1
pkgdesc="An implementation of Jsonnet in pure Go"
arch=("x86_64")
url="https://jsonnet.org/"
license=("Apache")
makedepends=("go")
conflicts=('jsonnet' 'go-jsonnet-git')
provides=('jsonnet')
source=("${pkgname}_v${pkgver}.tar.gz::https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8e28cbd1166eb073c5d82dc8d7ffcd3416ce58fc5bc72bd688eac7b3dc510f3ab2f4eaced9b99af71ec1a921363a884d38b46a88f674f525ea92c92751f556b0')

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
