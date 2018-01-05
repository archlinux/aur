# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: gh0stwizard <vitaliy.tokarev_AT_gmail.com>
# Contributor: slubman <slubman@slubman.net>

pkgname=tkabber
pkgver=1.1.2
pkgrel=1
pkgdesc="Tkabber is an open source Jabber client, written in Tcl/Tk."
arch=(any)
url="http://tkabber.jabber.ru/"
license=("GPL")
depends=('tcl' 'tk' 'bwidget' 'tcllib' 'tls')
source=(http://files.jabber.ru/tkabber/tkabber-$pkgver.tar.xz
	http://files.jabber.ru/tkabber/tkabber-plugins-$pkgver.tar.xz)
md5sums=('6d15da2d72bbc76a525f4b72b127fd8e'
         'cc876866fd00ae1068679bff1456e9cf')

build() {
  make -C "$srcdir"/$pkgname-$pkgver PREFIX=/usr
#  make -C "$srcdir"/$pkgname-plugins-$pkgver PREFIX=/usr
}

package() {
  make -C "$srcdir"/$pkgname-$pkgver install PREFIX="$pkgdir"/usr
  make -C "$srcdir"/$pkgname-plugins-$pkgver install PREFIX=/usr DESTDIR="$pkgdir"
  sed -i "s|"$pkgdir"||g" "$pkgdir"/usr/bin/*
}
