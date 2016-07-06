# Maintainer: Michael Straube <michael_straube web de>

pkgname=zoomtools
pkgver=12222006
pkgrel=2
pkgdesc="Tools for the Zoom PS-02, PS-04, MRS-8 multitrack recorders"
arch=('i686' 'x86_64')
url="http://www.engens.com/dwight/software.html"
license=('GPL')
depends=('gtk2' 'pangox-compat')
options=('!makeflags')
source=("http://www.engens.com/dwight/dl/$pkgname-12222005.tar.gz"
        "makefile.patch")
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

  for f in mid2seq mrs8_bintool ps02_to_ps04 ps02_tool ps04_tool zoom2wav; do
    install -m 755 cmdline/$f "$pkgdir/usr/bin/"
  done

  for f in mrs8 ps02; do
    install -m 755 gui/$f "$pkgdir/usr/bin/"
  done
}
