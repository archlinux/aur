# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=gops
pkgver=0.3.7
pkgrel=1
pkgdesc='A tool to list and diagnose Go processes currently running on your system'
arch=('i686' 'x86_64')
url='https://github.com/google/gops'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

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
sha256sums=('0d1ad5441e9260f675adc15507fa22cfc9721164c13b8df4cd028ce6b42ede2f')
