# Maintainer: Dmitri Goutnik <dg@syrec.org>
# Contributor: Tom Tobin <archlinux@tomxtobin.com>

pkgname=awless
pkgver=0.1.10
pkgrel=1
pkgdesc='A command line interface for Amazon Web Services (AWS)'
arch=('i686' 'x86_64')
url='https://github.com/wallix/awless'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d2e9075e1f16055796a699d165ff2b2dbc1b2fcf408bb644497553e3108a2cf3')

prepare() {
  mkdir -p src/github.com/wallix
  mv ${pkgname}-${pkgver} src/github.com/wallix/awless
}

build() {
  cd src/github.com/wallix/awless
  env GOPATH="${srcdir}" go build
}

# check() {
#   cd src/github.com/wallix/awless
#   env GOPATH="${srcdir}" go test ./...
# }

package() {
  cd src/github.com/wallix/awless
  install -Dm755 awless "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
