# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-apng-plugin
pkgver=1.0.0
pkgrel=1
pkgdesc="apng image plugin for Qt to support animated PNGs"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/qapng"
license=('BSD')
depends=('qt5-base' 'libpng')
makedepends=('git' 'qt5-tools')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/qapng.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            '536886c68918305f12db47b6d0e6fd2ebff8b6ac41ebdab7dc2985a23e739909')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake -r "../$_pkgfqn/"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/${pkgname}.rule"
}
