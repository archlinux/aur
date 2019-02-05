# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=gops
pkgver=0.3.6
pkgrel=1
pkgdesc='A tool to list and diagnose Go processes currently running on your system'
arch=('i686' 'x86_64')
url='https://github.com/google/gops'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a6a7c387f1ce6663ee589da790bb8fcb480be7d67ead3b236f546b7119f96893')

prepare() {
  mkdir -p src/github.com/google
  mv ${pkgname}-${pkgver} src/github.com/google/gops
}

build() {
  cd src/github.com/google/gops
  env GOPATH="${srcdir}" go build
}

# check() {
#   cd src/github.com/google/gops
#   env GOPATH="${srcdir}" go test ./...
# }

package() {
  cd src/github.com/google/gops
  install -Dm755 gops "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
