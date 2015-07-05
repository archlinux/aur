# Contributor: zoulnix <http://goo.gl/HQaP>

pkgname=g15macro
pkgver=1.0.3
pkgrel=4
pkgdesc='A simple Macro recording/playback app for G15Daemon.'
arch=('i686' 'x86_64')
url='http://www.g15tools.com/'
license=('GPL')
depends=('g15daemon' 'libxtst')
options=('!libtool')
source=("http://downloads.sourceforge.net/g15daemon/$pkgname-$pkgver.tar.bz2"
        "$pkgname-$pkgver-Makefile.am.patch"
        "$pkgname-$pkgver-configure.in.patch")
sha256sums=('2645118330e61208d67026a5a212c342f556971945c43d14c60809b7748be2d6'
            '2c4d8825bf69d30894960547121b86d7a603283caa72eb1f81b400742061a6ed'
            '85e6a7fc0e3aef2bfed36049c074d92b7fdd5b3a2eefaacb8c93b62a725c6d73')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg "Patching..."
  for i in $srcdir/*.patch; do
    patch -Np1 -i "$i"
  done

  autoreconf -vis

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
