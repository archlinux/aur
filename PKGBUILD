# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=sops
pkgver=3.1.0
pkgrel=1
pkgdesc='Editor of encrypted files that supports YAML, JSON and BINARY formats'
arch=('i686' 'x86_64')
url='https://github.com/mozilla/sops'
license=('MPL2')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('9be1ea2d21951e09b7c8da94e6fedd1fa0f3d848fd4ebc84928748819eb00a3e')

prepare() {
  mkdir -p src/go.mozilla.org
  mv ${pkgname}-${pkgver} src/go.mozilla.org/sops
}

build() {
  cd src/go.mozilla.org/sops
  env GOPATH="${srcdir}" go build ./cmd/sops
}

# check() {
#   cd src/go.mozilla.org/sops
#   env GOPATH="${srcdir}" go test
# }

package() {
  cd src/go.mozilla.org/sops
  install -Dm755 sops "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
