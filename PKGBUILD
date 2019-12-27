# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-apng-plugin
pkgver=1.1.1
pkgrel=2
pkgdesc="An apng image plugin for Qt to support animated PNGs"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtApng"
license=('BSD')
depends=('qt5-base' 'libpng')
makedepends=('git' 'qt5-tools')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtApng.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            'eaf4fe81c8521aeec2e0eca0a369542f914a8d57234d6edde6da8d5bb9bed505')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake "CONFIG+=system_libpng" "../$_pkgfqn/"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}
