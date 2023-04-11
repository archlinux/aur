# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libupnp-git
pkgver=1.14.16.r1.ge634b2ce
pkgrel=1
pkgdesc="Portable open source UPnP development kit"
arch=('i686' 'x86_64')
url="https://pupnp.sourceforge.io/"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=("libupnp=$pkgver")
conflicts=('libupnp')
options=('staticlibs')
source=("git+https://github.com/pupnp/pupnp.git")
sha256sums=('SKIP')


pkgver() {
  cd "pupnp"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pupnp"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --enable-reuseaddr
  make
}

check() {
  cd "pupnp"

  make check
}

package() {
  cd "pupnp"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libupnp"
}
