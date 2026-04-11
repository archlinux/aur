# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Patchance
pkgname="${_name,,}"
pkgver=1.4.0
pkgrel=1
pkgdesc='A modern graphical patchbay for JACK'
arch=(any)
url='https://github.com/Houston4444/Patchance'
license=(GPL-2.0-only)
# Note: namcap false positives:
# * 'xdg' is included in the patchance python src dir.
# * 'cffi' is imported in some test modules, but not actually used. 
depends=(hicolor-icon-theme python-pyqt6 python-qtpy python-jack-client python-pyliblo qt6-svg)
makedepends=(qt6-tools)
optdepends=(
  'python-pyalsa: ALSA ports connection support'
)
groups=(pro-audio)
source=("https://github.com/Houston4444/Patchance/releases/download/v$pkgver/$_name-$pkgver-source.tar.gz")
sha256sums=('53bfe5fb3cfc4f5726104630afaf0df89e86fcad2b6c91662943af79e56fee4c')

prepare() {
  cd $_name-$pkgver
  sed -e 's/rcc -g/$(RCC) -g/' -i Makefile
}

build() {
  cd $_name-$pkgver
  make -j 1 LRELEASE=/usr/lib/qt6/bin/lrelease RCC=/usr/lib/qt6/rcc
}

package() {
  cd $_name-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
