# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Radu Andries <admiral0@tuxfamily.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=zbar-git
pkgver=iPhoneSDK.1.3.1.r10.g453a338
pkgrel=1
pkgdesc="Application and library for reading bar codes from various sources"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://zbar.sourceforge.net/"
license=('LGPL')
depends=('v4l-utils' 'autoconf')
conflicts=('zbar-gtk' 'zbar-qt' 'zbar')
source=("$pkgname"::'git://github.com/vbmithr/ZBar#branch=neon')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  autoreconf --install
  ./configure --prefix=/usr --without-python --without-qt --without-gtk

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
