# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Patchance
pkgname="${_name,,}"
pkgver=1.3.2
pkgrel=1
pkgdesc='A modern graphical patchbay for JACK'
arch=(any)
url='https://github.com/Houston4444/Patchance'
license=(GPL-2.0-only)
depends=(hicolor-icon-theme python-pyqt6 python-qtpy python-jack-client python-pyliblo qt6-svg)
makedepends=(qt6-tools)
optdepends=(
  'python-pyalsa: ALSA ports connection support'
)
groups=(pro-audio)
source=("https://github.com/Houston4444/Patchance/releases/download/v$pkgver/$_name-$pkgver-source.tar.gz")
sha256sums=('5e838637154a7b46ad2c13e1f3a3b657bd6fbab0b389cab00688010d0e5c9224')

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
