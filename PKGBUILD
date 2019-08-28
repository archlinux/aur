# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=dotherside
_pkgname=DOtherSide
pkgver=0.6.3
pkgrel=1
pkgdesc='C language library for creating bindings for the Qt QML language'
arch=('x86_64')
url='https://github.com/filcuc/DOtherSide'
license=('LGPL' 'GPL')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-declarative')
makedepends=('meson' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d7da098613bf96b17825ea268ff9278b7805073117fdac4cba62226c8e75722e62a17dfc767cdd8816eaa14760ad7e02fd07d8fd0969df4e4eeed9066575956f')

build() {
  mkdir -p $_pkgname-$pkgver/build
  cd $_pkgname-$pkgver/build

  arch-meson ..

  ninja
}

package() {
  cd $_pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install

  # Install license
  install -Dm 644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

