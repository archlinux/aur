# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hiredis-git
pkgver=0.14.0.r151.g3421ac3
pkgrel=1
pkgdesc="Minimalistic C client library for Redis"
arch=('i686' 'x86_64')
url="https://github.com/redis/hiredis/"
license=('BSD')
depends=('glibc')
makedepends=('git')
checkdepends=('redis')
provides=('hiredis')
conflicts=('hiredis')
options=('staticlibs')
source=("git+https://github.com/redis/hiredis.git")
sha256sums=('SKIP')


pkgver() {
  cd "hiredis"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "hiredis"

  make PREFIX="/usr"
}

check() {
  cd "hiredis"

  make check
}

package() {
  cd "hiredis"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/hiredis"
}
