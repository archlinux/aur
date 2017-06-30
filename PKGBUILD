# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=sugar-activity-read
_pkgname=Read
pkgver=118
pkgrel=2
pkgdesc="Sugar activity to read books"
arch=('any')
url="https://wiki.sugarlabs.org/go/Activities/Read"
license=('GPL')
groups=('sugar-fructose')
depends=('evince' 'python2-beautifulsoup4' 'sugar-toolkit-gtk3' 'webkitgtk')
source=(https://download.sugarlabs.org/sources/sucrose/fructose/$_pkgname/$_pkgname-$pkgver.tar.bz2
        bs4-port.patch)
sha256sums=('652c66a08c0f6b98e25c1e4d51ac7caffd4a2beefae8c3fd1209e8a432ec0052'
            'dab39eb8658c850a684856a698934791e79e8e68b20132a462583da3f12c1d1c')

prepare() {
  cd $_pkgname-$pkgver
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' readdialog.py setup.py

  # Port to Beautiful Soup 4
  patch -Np1 -i ../bs4-port.patch
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --prefix "$pkgdir/usr"
  rm -r "$pkgdir"/usr/share/applications
}
