# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libupnp-git
pkgver=1.8.2.r12.gf07f078
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
source=("git+https://git.code.sf.net/p/pupnp/code")
sha256sums=('SKIP')


pkgver() {
  cd "code"

  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "code"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "code"

  #make check
}

package() {
  cd "code"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/libupnp/LICENSE"
}
