# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jorge Mokross <mokross@gmail.com>

pkgname=notify-sharp
pkgver=0.4.1
pkgrel=3
pkgdesc="C Sharp D-Bus client library for desktop notifications"
arch=('any')
url="https://www.meebey.net/projects/notify-sharp/"
license=('MIT')
depends=('gtk-sharp-2' 'dbus-sharp-glib') 
source=(https://www.meebey.net/projects/notify-sharp/downloads/$pkgname-$pkgver.tar.gz
        use_dbussharp_2.pc)
sha512sums=('d72b4f5eb23b1e6bd3ab2ebd89eed963dab2212b895a080f0803f59f5746b08194720799e9ce979fa10ad8e01847ee2b379576e6856ffbcf1e0945682c89f407'
            '4164e0e6e2d7c7ac8b28d0d450fec01a8875bde98962c9164527e783286f1ab9167346aa8801503d8d3c4021dbb779240b860432fb04e757a31476584683e210')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../use_dbussharp_2.pc
  sed -i 's/gmcs/mcs/' configure{,.ac}
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
