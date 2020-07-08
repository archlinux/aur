# Maintainer: Ukang'a <ukanga@users.noreply.github.com>
pkgname=sre-tooling
pkgver=master
pkgrel=1
pkgdesc="A set of useful SRE tools."
arch=('x86_64')
url="https://github.com/onaio/sre-tooling"
license=('Apache License 2.0')
depends=(
  'sudo'
  'git'
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/onaio/sre-tooling/archive/${pkgver}.tar.gz")
sha1sums=('SKIP')

build() {
  export GOPATH="$srcdir"/gopath
  echo $GOPATH
  cd "$srcdir/$pkgname-$pkgver"
  EXTRA_GOFLAGS="-modcacherw" make VERSION=$pkgver DESTDIR="$pkgdir" build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}
