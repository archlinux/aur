# Maintainer: Michael Straube <m.s.online gmx de>
pkgname=zoomtools
pkgver=12222006
pkgrel=1
pkgdesc="Tools for the Zoom PS-02, PS-04, MRS-8 multitrack recorders"
arch=('i686' 'x86_64')
url="http://www.engens.com/dwight/software.html"
license=('GPL')
depends=('gtk2' 'pangox-compat')
source=(http://www.engens.com/dwight/dl/zoomtools-12222005.tar.gz
        makefile.patch)
sha1sums=('fe7908999571fbf30d53a390dfeb6a6b2b9fedc9'
          '91611ca89d79f0a83440b6bf8228b7efca326f34')

prepare() {
  cd $pkgname-$pkgver

  patch -p 0 < "$srcdir/makefile.patch"
}

build() {
  cd $pkgname-$pkgver

  make
  cd gui && make
}

package() {
  cd $pkgbase-$pkgver

  install -d -m 755 "$pkgdir/usr/bin"

  install -m 755 cmdline/mid2seq "$pkgdir/usr/bin/"
  install -m 755 cmdline/mrs8_bintool "$pkgdir/usr/bin/"
  install -m 755 cmdline/ps02_to_ps04 "$pkgdir/usr/bin/"
  install -m 755 cmdline/ps02_tool "$pkgdir/usr/bin/"
  install -m 755 cmdline/ps04_tool "$pkgdir/usr/bin/"
  install -m 755 cmdline/zoom2wav "$pkgdir/usr/bin/"

  install -m 755 gui/mrs8 "$pkgdir/usr/bin/"
  install -m 755 gui/ps02 "$pkgdir/usr/bin/"
}
