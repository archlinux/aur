# Maintainer: Tommaso Sardelli <lacapannadelloziotom [AT] gmail [DOT] com>
pkgname=go-jsonnet
_basepkgname=jsonnet
pkgver=0.21.0
pkgrel=1
pkgdesc="An implementation of Jsonnet in pure Go"
arch=("x86_64")
url="https://jsonnet.org/"
license=("Apache")
makedepends=("go")
conflicts=('jsonnet' 'go-jsonnet-git')
provides=('jsonnet')
source=("${pkgname}_v${pkgver}.tar.gz::https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ced2f4038942eeaf0c03f7f97737caa1f48aeb42b97f768353416c7bc943384ae5a3cc0920796ce49695638cd75adb3e472dc840606baedd6743b94807b75a07')

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
