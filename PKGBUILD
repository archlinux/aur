# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=xnc
pkgver=5.0.4
pkgrel=8
pkgdesc="X nortern captain file manager"
arch=(x86_64)
url="http://xnc.jinr.ru/"
license=('GPL')
depends=('gcc-libs' 'libpng' 'libtiff' 'libsm' 'libxext' 'libjpeg>=7')
makedepends=('libxt')
options=('!makeflags')
#source=(http://xnc.jinr.ru/src-5/xnc-$pkgver.src.tar.gz xnc-gcc44.patch)
source=(https://sources.archlinux.org/other/community/xnc/xnc-$pkgver.src.tar.gz
	xnc-gcc44.patch
	libpng15.patch)
md5sums=('62446cdfdf5730f125fb351a658c0bd3'
         'c0037a081824bca691e59a4ec68b6686'
         '7159af1c645fda860f0e5057100651ad')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 <"$srcdir"/xnc-gcc44.patch
  patch -p1 <"$srcdir"/libpng15.patch
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
