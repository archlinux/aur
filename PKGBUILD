# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libupnp-git
pkgver=1.8.4.r18.gb3f55df
pkgrel=1
pkgdesc="Portable open source UPnP development kit"
arch=('i686' 'x86_64')
url="http://pupnp.sourceforge.net/"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('libupnp')
conflicts=('libupnp')
options=('staticlibs')
source=("git+https://github.com/mrjimenez/pupnp.git")
sha256sums=('SKIP')


pkgver() {
  cd "pupnp"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pupnp"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "pupnp"

  make check
}

package() {
  cd "pupnp"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/libupnp/COPYING"
}
