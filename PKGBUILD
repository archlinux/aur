# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libjitterentropy-git
pkgver=2.1.2.r0.gf5a80c6
pkgrel=1
pkgdesc="Hardware RNG based on CPU timing jitter library"
arch=('i686' 'x86_64')
url="https://www.chronox.de/jent.html"
license=('BSD' 'GPL')
depends=('glibc')
makedepends=('git')
provides=('jitterentropy')
conflicts=('jitterentropy')
source=("git+https://github.com/smuellerDD/jitterentropy-library.git")
sha256sums=('SKIP')


prepare() {
  cd "jitterentropy-library"

  sed -i -e 's|sbin|bin|g' Makefile
}

pkgver() {
  cd "jitterentropy-library"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "jitterentropy-library"

  make
}

package() {
  cd "jitterentropy-library"

  install -dm755 "$pkgdir/usr/include"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/libjitterentropy/COPYING"
}
