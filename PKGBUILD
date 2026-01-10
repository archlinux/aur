# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Henrique C. Alves <hcarvalhoalves@gmail.com>

pkgname=matchbox-window-manager
pkgver=1.2.3
pkgrel=1
pkgdesc="A pretty much unique X window manager with a classic PDA management policy"
arch=('x86_64')
license=('GPL')
depends=('libmatchbox' 'startup-notification' 'libsm' 'libxcursor')
url="http://matchbox-project.org/"
source=("https://git.yoctoproject.org/$pkgname/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('643a9dac3afbfa0d33505448cc136f2593f949b8f7d6cc1e6fddc2d1c20ea805')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e '/AM_GCONF_SOURCE_2/d' -e '/data\/schemas\/Makefile/d' configure.ac
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr \
	--enable-startup-notification --enable-session \
	--enable-alt-input-wins --enable-expat
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
