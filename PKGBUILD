# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=sops
pkgver=3.0.5
pkgrel=1
pkgdesc='Editor of encrypted files that supports YAML, JSON and BINARY formats'
arch=('i686' 'x86_64')
url='https://github.com/mozilla/sops'
license=('MPL2')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('4a47f33e5e4e5b7bd252ec2121a07e4b1b0081f3570d51477e36a85786dd3378')

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
