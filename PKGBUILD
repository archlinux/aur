# Maintainer: Tommaso Sardelli <lacapannadelloziotom [AT] gmail [DOT] com>
pkgname=go-jsonnet
_basepkgname=jsonnet
pkgver=0.20.0
pkgrel=1
pkgdesc="An implementation of Jsonnet in pure Go"
arch=("x86_64")
url="https://jsonnet.org/"
license=("Apache")
makedepends=("go")
conflicts=('jsonnet' 'go-jsonnet-git')
provides=('jsonnet')
source=("${pkgname}_v${pkgver}.tar.gz::https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0ba06e254a6442764fd016c912968ab373b7fd21044175bbbc465b8fbda42f669bcbbd30d518427279d44f84b9b7678f7152192116c58c4b0bd1642f24136a3c')

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
