# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jitterentropy-git
pkgver=1.0.8.r4.gad4d636
pkgrel=1
pkgdesc="Jitter RNG daemon"
arch=('i686' 'x86_64')
url="http://www.chronox.de/jent.html"
license=('BSD' 'GPL')
depends=('glibc')
makedepends=('git')
#provides=('jitterentropy')
#conflicts=('jitterentropy')
source=("git+https://github.com/smuellerDD/jitterentropy-rngd.git")
sha256sums=('SKIP')


prepare() {
  cd "jitterentropy-rngd"

  sed -i -e 's|sbin|bin|g' Makefile
}

pkgver() {
  cd "jitterentropy-rngd"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "jitterentropy-rngd"

  make
}

package() {
  cd "jitterentropy-rngd"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/jitterentropy/COPYING"
}
