# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=iconthemebrowser
pkgver=1.1.0
pkgrel=2
pkgdesc="A small application to browse icon themes available in Qt"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/IconThemeBrowser"
license=('BSD')
depends=('qt5-base' 'qt5-tools')
makedepends=('git' 'qpm')
optdepends=('qt5-imageformats: Support for additional icon types'
            'qt5-svg: Support for SVG-Icons')
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/IconThemeBrowser.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  mkdir -p build

  cd "$_pkgfqn"
  qpm install
}

build() {
  cd build

  qmake -r "../$_pkgfqn/"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  cd "../$_pkgfqn"
  install -D -m644 de.skycoder42.${pkgname}.desktop "$pkgdir/usr/share/applications/de.skycoder42.${pkgname}.desktop"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
