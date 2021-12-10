# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname=pick-colour-picker
pkgver=1.51
pkgrel=1
pkgdesc="Colour picker that remembers where you picked colours from"
arch=(any)
url="https://www.kryogenix.org/code/pick/"
license=(MIT)
depends=(gtk3 python-cairo python-gobject)
makedepends=(git python-setuptools)
_commit=dec8f144918aa7964aaf86a346161beb7e997f09 #jan-22
source=("git+https://github.com/stuartlangridge/ColourPicker#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd ColourPicker
  sed -i 's/if theme_icon and False:/if theme_icon:/' pick/__main__.py
  sed -i '/pixmaps/d' setup.py
}

build() {
  cd ColourPicker
  python3 setup.py build
}

package() {
  cd ColourPicker
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 $pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
