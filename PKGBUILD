# Maintainer: Your Name <youremail@domain.com>
pkgname=miraclecast
_name=miraclecast
pkgver=185.a92df37
pkgrel=1
#epoch=
pkgdesc="MiracleCast provides software to connect external monitors to your system via Wifi. It is compatible to Miracast. Link-management works, everything else is still being worked on. Replaces openwfd."
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/miracle/"
license=('GPL')
#groups=()
depends=("systemd-kdbus" "kdbus") #kdbus-git provides kdbus
#makedepends=()
#optdepends=()
provides=("miraclecast")
#conflicts=()
source=("$_name::git+https://github.com/albfan/miraclecast.git#branch=master")
md5sums=('SKIP') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$_name"
  ./autogen.sh --prefix=/usr
  ./configure
  make
}

check() {
  cd "$srcdir/$_name"
  make -k check
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "$srcdir/$_name"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
