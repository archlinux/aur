# Maintainer: Det <nimetonmaili g-mail>
# Contributor: Matt Parnell/ilikenwf <parwok@gmail.com>
# Based on [extra]'s xproto: https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/xproto

_pkgname=xproto
pkgname=$_pkgname-git
pkgver=7.0.27.1.r246.g70cf8ac
pkgrel=1
pkgdesc="X11 core wire protocol and auxiliary headers - Git version"
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
