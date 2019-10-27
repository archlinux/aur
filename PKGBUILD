# Maintainer: Andrew Rabert <ar@nullsum.net>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Ian Beringer <ian@ianberinger.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf
pkgver=13
pkgrel=2
license=('MIT')
pkgdesc="A terminal file manager inspred by ranger written in Go"
depends=('glibc')
makedepends=('go')
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/gokcehan/lf"
source=("$pkgname-r$pkgver.tar.gz::https://github.com/gokcehan/$pkgname/archive/r$pkgver.tar.gz")
sha256sums=('fe99ed9785fbdc606835139c0c52c854b32b1f1449ba83567a115b21d2e882f4')
_srcname=${pkgname}-r$pkgver

build() {
  export GOPATH="${srcdir}"
  mkdir -p "${GOPATH}/src"
  rm -rf "${GOPATH}/src/${_srcname}"
  mv "${_srcname}" "${GOPATH}/src"
  cd "${GOPATH}/src/${_srcname}"
  go get
  version=r$pkgver ./gen/build.sh -trimpath
}

package() {
  cd "${GOPATH}/src/${_srcname}"
  install -Dm755 ./lf "${pkgdir}"/usr/bin/lf
  install -Dm644 ./LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ./README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
