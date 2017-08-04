# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=dolphin-seafile-plugin
pkgver=1.0.0
pkgrel=1
pkgdesc="A plugin for dolphin to show the seafile synchronization status"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/$pkgname"
license=('BSD')
depends=('qt5-base' 'kio' 'dolphin' 'seafile')
makedepends=('qt5-tools' 'git')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
source=("$pkgname-$pkgver::git+https://github.com/Skycoder42/$pkgname.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            'e4826f9c5fce256f6637f0246923b191c5d0eb6b0dc17d8839a4e4fc0ebbee4f')

prepare() {
  mkdir -p build
}

build() {
  cd build
  
  qmake -r "../$pkgname-$pkgver/plugin/plugin.pro"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
  
  cd "../$pkgname-$pkgver"  
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"  
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/${pkgname}.rule"
}
