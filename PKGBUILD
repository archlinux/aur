# Maintainer: Dmitri Goutnik <dg@syrec.org>
# Contributor: Tom Tobin <archlinux@tomxtobin.com>

pkgname=awless
pkgver=0.1.11
pkgrel=2
pkgdesc='A command line interface for Amazon Web Services (AWS)'
arch=('i686' 'x86_64')
url='https://github.com/wallix/awless'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1a78636face8753cb983a5e4c1e3bfc9e1940e7eb932aa01fe2cbded46fd4292')

prepare() {
  mkdir -p src/github.com/wallix
  mv ${pkgname}-${pkgver} src/github.com/wallix/awless
}

build() {
  cd src/github.com/wallix/awless
  env GOPATH="${srcdir}" GO111MODULE=off go build
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
