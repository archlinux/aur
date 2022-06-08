# Maintainer: bgme <i@bgme.me>
# Contributor: ml <>

_pkgname=probe-cli
pkgname=ooniprobe-cli
pkgver=3.15.1
pkgrel=1
pkgdesc='Next generation OONI Probe CLI'
arch=('x86_64')
url='https://ooni.org/'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/ooni/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8cc06915204227f4c2b83c04d008c2ec732705ecb01aa82d13ef16ae7d51f3f8')
sha512sums=('28468ffd9a9f5db9ae4fd5869e78963500906c6c1cb5eb650b9ac5b88edf8ad15e37ec83346fe165cf56a3c6ad8f152286669dffdb6c5efeee97daeb5fb725d9')


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
