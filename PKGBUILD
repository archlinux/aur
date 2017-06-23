# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gpxviewer
pkgver=0.5.3
pkgrel=1
pkgdesc="GPS trace viewer"
arch=('any')
url="http://andrewgee.org/blog/projects/gpxviewer/"
license=('GPL3')
depends=('gtk3' 'osm-gps-map' 'python2-cairo' 'python2-gobject' 'python2-gobject2')
makedepends=('python2-distutils-extra')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewgee/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('712632997213ccf150efe90079ad84e53c525d4b36dda68198e0e928e866cde4')

prepare() {
	cd $pkgname-$pkgver
	find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

build() {
	cd $pkgname-$pkgver
	python2 setup.py build
}

package() {
	cd $pkgname-$pkgver
	python2 setup.py install --root "$pkgdir" --optimize=1
}
