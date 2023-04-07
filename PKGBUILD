# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gottengeography
pkgver=2.5
pkgrel=13
pkgdesc='Easy to use photo geotagging application for the GNOME desktop'
arch=('any')
url='https://launchpad.net/gottengeography'
license=('GPL3')
depends=('libchamplain' 'libgexiv2' 'python-dateutil' 'python-gobject')
makedepends=('git' 'python-distutils-extra')
_commit=7ea816fcaad366a4c6be6b16725fc3e1bff57e4d  # master
source=("git+https://git.launchpad.net/gottengeography#commit=$_commit"
        'gottengeography.appdata.xml'
        'fixes.patch')
sha256sums=('SKIP'
            '8cf14124c72dd6213254ce0f3a8404916f30f2bd9b9350530760d77825632d75'
            '6adfc419b27dd2f10e787e5296d8904612aaf0cdca0d1f9949d37d42daf86047')

prepare() {
  cd $pkgname
  # Various fixes
  patch -Np1 -i ../fixes.patch
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  # adding --skip-build makes it not install usr/share/{help,locale}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 ../gottengeography.appdata.xml "$pkgdir/usr/share/metainfo/gottengeography.appdata.xml"
}
