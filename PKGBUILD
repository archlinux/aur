# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=soundtouch-git
pkgver=2.1.1.r0.gb9659b6
pkgrel=1
pkgdesc="Audio tempo/pitch control library"
arch=('i686' 'x86_64')
url="https://www.surina.net/soundtouch/"
license=('LGPL')
depends=('gcc-libs')
makedepends=('git')
provides=('soundtouch')
conflicts=('soundtouch')
source=("git+https://gitlab.com/soundtouch/soundtouch.git")
sha256sums=('SKIP')


pkgver() {
  cd "soundtouch"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "soundtouch"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

package() {
  cd "soundtouch"

  make DESTDIR="$pkgdir" install

  rm "$pkgdir/usr/share/doc/soundtouch/COPYING.TXT"
}
