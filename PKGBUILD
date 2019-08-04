# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: gh0stwizard <vitaliy.tokarev_AT_gmail.com>
# Contributor: slubman <slubman@slubman.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tkabber
pkgver=1.1.2
pkgrel=2
pkgdesc="Jabber client written in Tcl/Tk."
arch=('any')
url="http://tkabber.jabber.ru/"
license=('GPL')
depends=('tcl' 'tk' 'bwidget' 'tcllib' 'tcltls')
source=(http://files.jabber.ru/tkabber/tkabber-$pkgver.tar.xz
	http://files.jabber.ru/tkabber/tkabber-plugins-$pkgver.tar.xz)
sha256sums=('35a57f8061c4bf3815d0ebc8abbb8f6a8c2da2b89a9579eb2958497aa1353855'
            '65f46cda1c23b0c7e0bd95c149988e259c13392feb910717d81143dcae39ab40')

build() {
  make -C "$srcdir"/$pkgname-$pkgver PREFIX=/usr
}

package() {
  make -C "$srcdir"/$pkgname-$pkgver install PREFIX="$pkgdir"/usr
  make -C "$srcdir"/$pkgname-plugins-$pkgver install PREFIX=/usr DESTDIR="$pkgdir"
  sed -i "s|"$pkgdir"||g" "$pkgdir"/usr/bin/*
}
