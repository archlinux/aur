# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=iconthemebrowser
pkgver=1.1.0
pkgrel=1
pkgdesc="A small application to browse icon themes available in Qt"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/IconThemeBrowser"
license=('BSD')
depends=('qt5-base' 'qt5-tools')
makedepends=('git' 'qpm')
optdepends=('qt5-imageformats: Support for additional icon types'
            'qt5-svg: Support for SVG-Icons')
source=("$pkgname-$pkgver::git+https://github.com/Skycoder42/IconThemeBrowser.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  qpm install

  qmake
  make qmake_all
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  
  install -D -m644 de.skycoder42.${pkgname}.desktop "$pkgdir/usr/share/applications/de.skycoder42.${pkgname}.desktop"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
