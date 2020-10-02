# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=dolphin-seafile-plugin
pkgver=1.2.1
pkgrel=1
pkgdesc="A plugin for dolphin to show the seafile synchronization status"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/$pkgname"
license=('BSD')
depends=('qt5-base' 'kio' 'dolphin' 'seafile' 'libsearpc')
makedepends=('qt5-tools' 'git')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
source=("$pkgname-$pkgver::git+https://github.com/Skycoder42/$pkgname.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            '887d32d86375c21fa49b1a9ce4960f23215db96f890e509115c89258a6779978')

prepare() {
  mkdir -p build
}

build() {
  cd build
  
  qmake "../$pkgname-$pkgver/"
  make qmake_all
  make
}

package() {
  cd build/plugin
  make INSTALL_ROOT="$pkgdir" install
  
  cd "../../$pkgname-$pkgver"  
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/${pkgname}.rule"
}
