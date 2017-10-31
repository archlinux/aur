# $Id: PKGBUILD 195833 2016-11-14 17:40:01Z spupykin $
# Maintainer: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Previous Contributor: Urs Wolfer <uwolfer @ fwo.ch>

pkgname=qtemu
pkgver=1.0.5
pkgrel=11
pkgdesc="Graphical user interface for QEMU written in Qt4"
url="http://qtemu.org"
license=("GPL")
arch=('i686' 'x86_64')
makedepends=('cmake')
depends=('qemu' 'qt4')
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2
	"qtemu.desktop::https://sourceforge.net/p/qtemu/code/HEAD/tree/trunk/qtemu/misc/qtemu.desktop?format=raw")
sha256sums=('752942fae239996c826580fd0b32986cf96a92a0982710f726947ddf791dc921'
            '63d62b5971266d468dfdfce3f8bea796d8040e4afd6f61a35799a984922e1073')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/opt/qtemu .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/bin"
  ln -s /opt/qtemu/bin/qtemu "$pkgdir/usr/bin/qtemu"
  install -Dm0644 "$srcdir"/qtemu.desktop "$pkgdir"/usr/share/applications/qtemu.desktop
  install -Dm0644 images/crystal/new.png "$pkgdir"/usr/share/icons/qtemu.png
}
