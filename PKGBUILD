# Maintainer: nezu (aka dumbasPL) <vapciogaming@gmail.com>
pkgname=qmodmaster
pkgver=0.5.2
pkgrel=5
_fullver="$pkgver-3"
pkgdesc='QModMaster is a free Qt-based implementation of a ModBus master application. A graphical user interface allows easy communication with ModBus RTU and TCP slaves. QModMaster also includes a bus monitor for examining all traffic on the bus.'
arch=('any')
url='https://sourceforge.net/projects/qmodmaster/'

license=('LGPLv3')
depends=('qt5-base' 'libmodbus')
makedepends=('qt5-tools')

source=("$pkgname-code-$_fullver.zip::https://sourceforge.net/projects/$pkgname/files/qModMaster-code-$_fullver.zip/download"
        "$pkgname.desktop"
        "hideini.patch"
        "libmodbus.patch")
md5sums=('a6d99220ab398395e40df27f7a6765bb'
         '90ac286373187fbd954b5e12dd477ccf'
         'f24d9aac85c5607525bbf985208dfb00'
         'e805c93bd7afa6959ec7f61956ecafbc')

prepare() {
  cd "$srcdir/qModMaster-code-$_fullver"
  patch --strip=1 --input="${srcdir}/hideini.patch"
  patch --strip=2 --binary --input="${srcdir}/libmodbus.patch"
}

build() {
  cd "$srcdir/qModMaster-code-$_fullver"
  qmake-qt5
  make
}

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname/data/"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/bin"

  cp "$srcdir/qModMaster-code-$_fullver/qModMaster" "$pkgdir/usr/bin/$pkgname"
  cp "$srcdir/qModMaster-code-$_fullver/icons/connect-24.png" "$pkgdir/usr/share/$pkgname/data/icon.png"
  cp "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/"
}

