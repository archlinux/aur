# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=sugar-activity-paint
_pkgname=Paint
pkgver=65
pkgrel=1
pkgdesc="Sugar activity to create paintings or drawings"
arch=('any')
url="https://wiki.sugarlabs.org/go/Activities/Paint"
license=('GPL')
depends=('sugar-toolkit-gtk3')
source=(https://download.sugarlabs.org/sources/honey/$_pkgname/$_pkgname-$pkgver.tar.bz2)
sha256sums=('9b53cf296fac1bfff691d2d2ec8f5db43771e41b9e3dffaf346f99f424132c67')

prepare() {
  cd $_pkgname-$pkgver
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' setup.py
  sed -i 's/except GObject.GError:/except TypeError:/' Area.py
  rm -r fill
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --prefix "$pkgdir/usr"
}
