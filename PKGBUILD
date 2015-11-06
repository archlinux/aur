# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Weber <laochailan@web.de>

pkgname=taisei
pkgver=1.0a
pkgrel=3
pkgdesc="Open source Touhou clone"
arch=('i686' 'x86_64')
url="http://taisei-project.org/"
license=('MIT')
depends=('sdl_ttf' 'hicolor-icon-theme' 'libgl' 'libpng' 'freealut' 'glu')
makedepends=('cmake' 'mesa')
install=taisei.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/laochailan/taisei/archive/v$pkgver.tar.gz"
        "$pkgname-no-inlining.patch")
sha256sums=('1561c84c9fd8b9c7a91b864bdfc07fb811bb6da5c54cf32a2b6bd63de5f8f3ff'
            '2a39d4d9dbb0b8a3ab776ab24daa4ba29a97c739d2e74025bfd6b4149f8dc98c')

prepare() {
  patch -d $pkgname-$pkgver -Np1 < $pkgname-no-inlining.patch
}

build() {
  cd $pkgname-$pkgver

  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
