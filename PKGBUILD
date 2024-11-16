# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Felix Barz <skycoder42.de@gmx.de>

pkgname=qt5-apng-plugin
pkgver=1.1.4
pkgrel=1
pkgdesc="An apng image plugin for Qt to support animated PNGs"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtApng"
license=(BSD-3-Clause)
depends=('qt5-base' 'libpng-apng')
makedepends=('git' 'qt5-tools')
source=("git+https://github.com/Skycoder42/QtApng.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('6a2236dd2353fc1dda6f07457e5d686f75a6c1a27c47ca305dd4c0de0e09fb92'
            'eaf4fe81c8521aeec2e0eca0a369542f914a8d57234d6edde6da8d5bb9bed505')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake "CONFIG+=system_libpng" "../QtApng/"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  install -D -m644 "../QtApng/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}
