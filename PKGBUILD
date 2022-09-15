# Maintainer: bgme <i@bgme.me>
# Contributor: ml <>

_pkgname=probe-cli
pkgname=ooniprobe-cli
pkgver=3.16.3
pkgrel=1
pkgdesc='Next generation OONI Probe CLI'
arch=('x86_64')
url='https://ooni.org/'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/ooni/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f3e86d1682a750e8dd85c519715af540abb470af4df1b3bdac42a9ed3b9d6461')
sha512sums=('64230df4ebd69aa941303cc8dfdce6f0eec1a251cd64d123fa5c5e588942ea5249b7cb48a53883cdafb0ebcb8611b28347f688f567c961ef68e1cad628406364')

build() {
  cd "${_pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-ldflags=-linkmode=external -buildmode=pie -trimpath -modcacherw'
  go build ./cmd/ooniprobe
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 ooniprobe -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
