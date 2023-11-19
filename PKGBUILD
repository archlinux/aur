# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
_pkgname=protopedal
pkgname=protopedal-git
pkgver=0.1
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

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git checkout master
}

build() {
  export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe"
  export CXXFLAGS="${CFLAGS}"
  cd "$srcdir/$_pkgname"
  make all
}

package() {
  install -D -m755 "$srcdir/$_pkgname/protopedal" "$pkgdir/usr/bin/protopedal"
}
