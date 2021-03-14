# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Seth Schroeder <theking@kingdomofseth.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=leocad
pkgver=21.03
_libver=20.03
pkgrel=1
pkgdesc="A CAD program for creating virtual LEGO models"
arch=('i686' 'x86_64')
url="http://leocad.org"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme' 'gcc-libs' 'zlib')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leozide/leocad/archive/v$pkgver.tar.gz"
        "$pkgname-library-$_libver.zip::https://github.com/leozide/leocad/releases/download/v$pkgver/Library-$_libver.zip")
b2sums=('8bfee504e2cc8259a914edbc877850b749bd5f93958f505952b8c37f854e789dce73de58aa4ac452c2740d902a6f9de6ea292235048dc9f1d6199fb035e62ccd'
        '7fe30da444e0456a413102f2511deb690f6b818dd2626ae7baa2e4b29a197b56d77536f01dfccbcd4428811d89ee4d026361a5ff7506459df036e82e963debfe')

build() {
  cd "$pkgname-$pkgver"

  # create Makefile with QMake
  qmake-qt5 \
    INSTALL_PREFIX=/usr \
    DISABLE_UPDATE_CHECK=1 \
    LDRAW_LIBRARY_PATH=/usr/share/leocad \
    "$pkgname.pro"

  # build package
  make
}

package() {
  cd "$pkgname-$pkgver"

  # install to pkgdir
  make INSTALL_ROOT="$pkgdir" install

  # install parts library
  install -Dm644 "$srcdir/library.bin" -t "$pkgdir/usr/share/leocad"
}
