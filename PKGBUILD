# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=gops
pkgver=0.3.3
pkgrel=1
pkgdesc="A tool to list and diagnose Go processes currently running on your system"
arch=('i686' 'x86_64')
url="https://github.com/google/gops"
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('9d831d9991f2792f91de0b6780c3f267')

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
