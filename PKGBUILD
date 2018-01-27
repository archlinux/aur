# Maintainer: Dmitri Goutnik <dg@syrec.org>
# Contributor: Daniel Martí <mvdan@mvdan.cc>

pkgname=gb
pkgver=0.4.4
pkgrel=1
pkgdesc="The project based build tool for Go"
arch=('i686' 'x86_64')
url="https://github.com/constabulary/gb"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c7993ae1994ad85cbe35b833d36a137772599fe7ed720edec2d76ebf3fc4313b')

prepare() {
  mkdir -p src/github.com/constabulary
  mv ${pkgname}-${pkgver} src/github.com/constabulary/gb
  env GOPATH="${srcdir}" go get -d github.com/pkg/errors
}

build() {
  cd src/github.com/constabulary/gb
  for c in gb gb-vendor; do
    env GOPATH="${srcdir}" go build ./cmd/${c}
  done
}

# check() {
#   cd src/github.com/constabulary/gb
#   env GOPATH="${srcdir}" ./gb test
# }

package() {
  cd src/github.com/constabulary/gb
  install -Dm755 -t "${pkgdir}/usr/bin" gb gb-vendor
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
