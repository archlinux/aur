# Maintainer: Ukang'a <ukanga@users.noreply.github.com>
pkgname=sre-tooling-git
pkgver=v0.11.0.ff96311
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
source=("git+https://github.com/onaio/sre-tooling")
sha1sums=('SKIP')
provides=("sre-tooling")
conflicts=("sre-tooling")

build() {
  export GOPATH="$srcdir"/gopath
  echo $GOPATH
  cd "$srcdir/sre-tooling"
  EXTRA_GOFLAGS="-modcacherw" make VERSION=$pkgver DESTDIR="$pkgdir" build
}

package() {
  cd "$srcdir/sre-tooling"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}
