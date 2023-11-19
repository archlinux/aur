# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
pkgname=protopedal
pkgver=2.3
pkgrel=1
pkgdesc="Compatibility tool for sim racing pedals and force feedback steering wheels"
arch=('x86_64')
url="https://gitlab.com/openirseny/protopedal/"
license=('EUPL')
depends=()
makedepends=(
  gcc
  glibc
)
source=(git+https://gitlab.com/openirseny/protopedal)
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git checkout "release-$pkgver"
}

build() {
  export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe"
  export CXXFLAGS="${CFLAGS}"
  cd "$srcdir/$pkgname"
  make all
}

package() {
  install -D -m755 "$srcdir/$pkgname/protopedal" "$pkgdir/usr/bin/protopedal"
}
