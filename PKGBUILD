# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Daniel Dietrich <shaddow2k@@gmail..com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>

pkgname=imageenlarger
pkgver=0.9.1
pkgrel=2
pkgdesc="SmillaEnlarger is a graphical tool to resize, especially magnify bitmaps in high quality"
arch=('x86_64')
license=('GPL3')
#url="https://github.com/lupoDharkael/smilla-enlarger"
url="https://sourceforge.net/projects/imageenlarger/"
depends=('qt5-base')
source=(https://sourceforge.net/projects/imageenlarger/files/imageenlarger/SmillaEnlarger%20Release%20${pkgver}/SmillaEnlarger_${pkgver}_source.zip
	    SmillaEnlarger.desktop
	    Qt5.11.patch)
sha256sums=('548781b851c5dc3317f0460be19b9be1501c958f10af94ec3c5798b18b6bb884'
            'a39a831959cddc5f8d8a739eedb3d110a5529b0b992036c583ee699eaedaec06'
            '6a56ac3ec6cc9dce4719354c6a2a57d9efe83d7380b677d52fb1da0473710deb')

prepare() {
  cd SmillaEnlarger_${pkgver}_source/SmillaEnlargerSrc
  patch -Np1 -i ../../Qt5.11.patch
}

build() {
  cd SmillaEnlarger_${pkgver}_source/SmillaEnlargerSrc
  qmake ImageEnlarger.pro
  make
}

package() {
  install -Dm644 SmillaEnlarger.desktop -t "$pkgdir/usr/share/applications"

  cd SmillaEnlarger_${pkgver}_source/SmillaEnlargerSrc/
  install -Dm755 SmillaEnlarger -t "$pkgdir/usr/bin/"
  install -Dm644 docs/ReadMe.rtf -t $pkgdir/usr/share/doc/$pkgname
  install -Dm644 help/* -t "$pkgdir/usr/share/doc/$pkgname/help"
  install -Dm644 smilla.ico smilla.png -t "$pkgdir/usr/share/pixmaps"
}

