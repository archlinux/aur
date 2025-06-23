# Maintainer: Julian Pollinger <julian@pollinger.dev>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_pkgname=libpoly
pkgname=$_pkgname-git
pkgver=0.2.0.r0.gd4c917c
pkgrel=1
pkgdesc='C library for manipulating polynomials'
arch=('x86_64')
url="https://github.com/SRI-CSL/$_pkgname"
license=('LGPL')
depends=('gmp' 'gcc-libs')
makedepends=('cmake' 'ninja' 'python' 'git')
source=("git+https://github.com/SRI-CSL/$_pkgname.git")
sha512sums=('SKIP')
provides=("$_pkgname=$pkgver")
conflicts=('libpoly')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags $(git rev-list --tags --max-count=1) | sed 's/v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname/build"
  export CFLAGS=""
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -Wno-dev
  make
}

package() {
  cd "$_pkgname/build"
  DESTDIR="$pkgdir" make install
  install -Dm644 "$srcdir/$_pkgname/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
