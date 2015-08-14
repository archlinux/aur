# Contributor: Travis Willard <travis@archlinux.org> 
# Contributor: Paul Mattal <paul@mattal.com>
# Contributor: Thanasis Georgiou <contact@thgeorgiou.com>

pkgname=imwheel
pkgver=1.0.0pre12
pkgrel=5
pkgdesc="Mouse Wheel Tool for XFree86/Xorg"
arch=(i686 x86_64)
url="http://imwheel.sourceforge.net"
license=('GPL')
depends=('libxtst' 'libxmu')
backup=(etc/X11/imwheel/imwheelrc)
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz 
	etcdir-install.patch)
md5sums=('21d81db739ae95d96f9b650f7b826a14'
	'51359d20eb2a95136564db2d32e3ec38')

build() {
  cd $srcdir/$pkgname-$pkgver
  # patch to fix buggy location of ETCDIR
  patch -p1 -i ${srcdir}/etcdir-install.patch || return 1

  ./configure --prefix=/usr \
    --mandir=/usr/share/man
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}
