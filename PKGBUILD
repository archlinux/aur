# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libnpa
pkgver=0.5.1
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
pkgdesc='Free library for manipulating Nitroplus game files'
url='http://dev.pulsir.eu/krofna/'
depends=('boost-libs' 'zlib')
makedepends=('cmake' 'boost')
source=($pkgname-$pkgver.tar.gz::"https://github.com/FGRE/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname-fix-flex-function-prototype.patch")
sha256sums=('bd2235afcf51b383546497e6d073523c9de300260ca8f20d44147dd9ebf77644'
            'bdfbbb54e27cda8c7ce1e4b9ad31eb224fa9e88e2e18166a55d348e606086834')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < ../$pkgname-fix-flex-function-prototype.patch
}

build() {
  cd $pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
