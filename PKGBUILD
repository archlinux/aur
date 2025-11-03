# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Patchance
pkgname="${_name,,}"
pkgver=1.3.0
pkgrel=1
pkgdesc='A modern graphical patchbay for JACK'
arch=(any)
url='https://github.com/Houston4444/Patchance'
license=(GPL-2.0-only)
depends=(hicolor-icon-theme python-pyqt6 python-qtpy python-jack-client)
makedepends=(qt6-tools)
groups=(pro-audio)
source=("https://github.com/Houston4444/Patchance/releases/download/v$pkgver/$_name-$pkgver-source.tar.gz")
sha256sums=('2df4604f5b87ebd78fbea3708465114b623173fb0b78f6f7a9c0e36418c4cdf3')

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
