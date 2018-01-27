# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=sops
pkgver=3.0.2
pkgrel=1
pkgdesc="Editor of encrypted files that supports YAML, JSON and BINARY formats"
arch=('i686' 'x86_64')
url="https://github.com/mozilla/sops"
license=('MPL2')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c370664e8d9892ea7a5cdde371b3a5e83df7b546b1b0ec0c8d549a109365312d')

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
