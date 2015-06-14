# Maintainer: Det <nimetonmaili g-mail>
# Contributor: Matt Parnell /ilikenwf <parwok@gmail.com>
# Contributor: Jonathan <eyeswide@gmail.com>
# Based on [extra]'s libpciaccess: https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/libpciaccess

_pkgname=libpciaccess
pkgname=$_pkgname-git
pkgver=0.13.2.9.r277.g9b1bf11
pkgrel=1
pkgdesc="X11 PCI access library - Git version"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xorg/lib/$_pkgname/"
license=('custom')
makedepends=('git' 'xorg-util-macros')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!libtool')
source=("git://anongit.freedesktop.org/xorg/lib/$_pkgname")
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
