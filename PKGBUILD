# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Seth Schroeder <theking@kingdomofseth.com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=leocad
pkgver=21.01
_libver=20.03
pkgrel=1
pkgdesc="A CAD program for creating virtual LEGO models"
arch=('i686' 'x86_64')
url="http://leocad.org"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leozide/leocad/archive/v$pkgver.tar.gz"
        "$pkgname-library-$_libver.zip::https://github.com/leozide/leocad/releases/download/v$pkgver/Library-$_libver.zip")
b2sums=('c44147221de03e20004d3496016c0b103139707d10f41093230517e1b3f1a64da81effc2b7b8915df885740c2c321ff5bd26722508c7617f6ab200b0f497fc61'
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
