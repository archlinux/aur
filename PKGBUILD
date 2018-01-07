# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: kastor <kastor@fobos.org.ar>

pkgname=libdlna
pkgver=0.2.4
pkgrel=16
pkgdesc="Open-source implementation of DLNA (Digital Living Network Alliance) standards "
url="http://libdlna.geexbox.org"
license=("LGPL")
arch=('x86_64')
options=('!makeflags')  # not parallel safe, error find -ldlna
depends=('glibc' 'ffmpeg')
source=("http://libdlna.geexbox.org/releases/${pkgname}-${pkgver}.tar.bz2"
	libdlna-ffmpeg3.patch
	libdlna-avformat.patch)
md5sums=('64d7de57aff5a729f2434fc5e69b4ffc'
         '214e6957bbb1894082acb62974753f30'
         'f7a6f36930fa212b0422daf88befa856')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../libdlna-ffmpeg3.patch
  patch -p1 -i ../libdlna-avformat.patch
}

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make lib
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
