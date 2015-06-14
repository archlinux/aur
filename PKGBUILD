# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s scrnsaverproto: https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/scrnsaverproto

_pkgname=scrnsaverproto
pkgname=$_pkgname-git
pkgver=1.2.2.3.r58.g5cf9455
pkgrel=1
pkgdesc="X11 Screen Saver extension wire protocol - Git version"
arch=('any')
url="http://cgit.freedesktop.org/xorg/proto/$_pkgname/"
license=('custom')
makedepends=('git' 'xorg-util-macros')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://anongit.freedesktop.org/xorg/proto/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  echo $(git describe --long | cut -d "-" -f2-3 | tr - .).r$(git rev-list HEAD --count).$(git describe --long | cut -d "-" -f4)
}

build() {
  cd $_pkgname

  msg2 "Starting autogen.sh..."
  ./autogen.sh --prefix=/usr

  msg2 "Starting make..."
  make
}

package() {
  cd $_pkgname

  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
