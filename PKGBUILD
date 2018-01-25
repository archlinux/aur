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
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c370664e8d9892ea7a5cdde371b3a5e83df7b546b1b0ec0c8d549a109365312d')

prepare() {
  mkdir -p "${srcdir}/src/go.mozilla.org"
  mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/go.mozilla.org/${pkgname}"
}

build() {
  cd "${srcdir}/src/go.mozilla.org/${pkgname}"
  export GOPATH="${srcdir}"
  go build -o ${pkgname} ./cmd/sops
}

# check() {
#   cd "${srcdir}/src/go.mozilla.org/${pkgname}"
#   export GOPATH="${srcdir}"
#   go test
# }

package() {
  cd "${srcdir}/src/go.mozilla.org/${pkgname}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
