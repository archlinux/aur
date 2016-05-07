# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=nixieclock
pkgver=1.64
pkgrel=2
pkgdesc="Simple little desktop clock that displays date and time using nixie tube digits"
arch=('i686' 'x86_64')
url="http://seriss.com/people/erco/unixtools/nixieclock/"
license=('GPLv2')
depends=('fltk')
makedepends=("perl") # for pod2man
source=("http://seriss.com/people/erco/unixtools/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('a163cb859cf22cef491afa61f23e40ab1f193459cf20b47ee80a0805cb714915'
            '22104d05a441ad0d68e047faa4312e136b60c3fe59f6228a234664dcdd145bfc')

prepare() {
  sed -e 's|FLTK_DIR=/usr/local/src/fltk-1.3.x-svn|FLTK_DIR=/usr/bin|' \
      -e 's|--ldstaticflags|--ldflags --libs|' \
      -i $pkgname-$pkgver/Makefile
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -m755 nixie-text-viewer "$pkgdir"/usr/bin
  install -Dm644 docs/$pkgname.6 "$pkgdir"/usr/share/man/man6/$pkgname.6
  install -Dm644 icons/$pkgname-icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
