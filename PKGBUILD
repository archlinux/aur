# Maintainer: Andrei Alexeyev <akari@alienslab.net>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Weber <laochailan@web.de>

pkgname=taisei
pkgver=1.1.1
pkgrel=1
pkgdesc="Open source Touhou clone"
arch=('i686' 'x86_64')
url="https://taisei-project.org/"
license=('MIT')
depends=('sdl2_mixer' 'sdl2_ttf' 'libzip' 'hicolor-icon-theme')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::"https://github.com/taisei-project/taisei/archive/v$pkgver.tar.gz")
sha256sums=('36f645449f44781f59342b48b611668ac3d59b0025df02b866201ee723209dd7')

build() {
  cd $pkgname-$pkgver

  cmake ./ \
    -DTAISEI_VERSION_OVERRIDE=$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
