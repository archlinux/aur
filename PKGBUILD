# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=iconthemebrowser
pkgver=1.0.1
pkgrel=2
pkgdesc="A small application to browse icon themes available in Qt"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/IconThemeBrowser"
license=('BSD')
depends=('qt5-base' 'qt5-tools')
makedepends=('git')
optdepends=('qt5-imageformats: Support for additional icon types'
            'qt5-svg: Support for SVG-Icons')
source=("$pkgname-$pkgver::git+https://github.com/Skycoder42/IconThemeBrowser.git#tag=1.0.1")
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  git config submodule.DialogMaster.url "https://github.com/Skycoder42/DialogMaster.git"
  git submodule update --init --recursive

  qmake
  make qmake_all
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
