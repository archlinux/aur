# Maintainer: Kyle <kyle@gmx.ca>
pkgname=opus-git
_gitname=opus
pkgver=0.0 # automatically determined from git origin
pkgrel=3
pkgdesc="codec designed for interactive speech and audio transmission over the Internet (git master)"
arch=('i686' 'x86_64')
url="http://www.opus-codec.org/"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('opus')
conflicts=('opus')
options=('!libtool')
source=('git://git.opus-codec.org/opus.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed -e 's|v||' -e 's|-|.|g'
}

  build() {
  cd $_gitname
./autogen.sh
  ./configure --prefix=/usr --enable-custom-modes --disable-static
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  install -m755 -d "${pkgdir}/usr/share/licenses/opus"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/opus/"
}

# vim:set ts=2 sw=2 et:
