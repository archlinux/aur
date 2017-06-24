# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gottengeography
pkgver=2.5
_gitrev=dd98beb826da62f430d51749dfa340af3620053c
pkgrel=4
pkgdesc='Easy to use photo geotagging application for the GNOME desktop'
arch=('any')
url='https://launchpad.net/gottengeography'
license=('GPL3')
depends=('libchamplain' 'libgexiv2' 'python-dateutil' 'python-gobject')
makedepends=('python-distutils-extra')
source=($pkgname-$pkgver.tar.gz::https://git.launchpad.net/gottengeography/snapshot/$pkgname-$_gitrev.tar.gz
        fixes.patch)
sha256sums=('510e6cb9d2e5ca5f103d8b5c0203a4d6e7f886cf5213aff907d99bd3f726b000'
            'e0f2115a1bbc6fefd60d3018567180a69cf9e502ecef8d92cb525b5fda8f1351')

prepare() {
	cd $pkgname-$_gitrev
	patch -Np1 -i ../fixes.patch
}

build() {
	cd $pkgname-$_gitrev
	python setup.py build
}

package() {
	cd $pkgname-$_gitrev
	python setup.py install --root "$pkgdir" --optimize=1
}
