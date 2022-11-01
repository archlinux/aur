# Maintainer: Tommaso Sardelli <lacapannadelloziotom [AT] gmail [DOT] com>
pkgname=go-jsonnet
_basepkgname=jsonnet
pkgver=0.19.1
pkgrel=1
pkgdesc="An implementation of Jsonnet in pure Go"
arch=("x86_64")
url="https://jsonnet.org/"
license=("Apache")
makedepends=("go")
conflicts=('jsonnet' 'go-jsonnet-git')
provides=('jsonnet')
source=("${pkgname}_v${pkgver}.tar.gz::https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('48974d179d6ef02f0de616505146df3d307db553d0ca05284825247c7de028c5dd469b8749f184adb1f7d04bc0ce1692ed75d5a50edaf8c768b72e23cf1355b1')

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
