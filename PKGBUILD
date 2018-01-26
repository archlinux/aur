# Maintainer: Andrei Alexeyev <akari@alienslab.net>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Weber <laochailan@web.de>

pkgname=taisei
pkgver=1.2
pkgrel=1
pkgdesc="Open source Touhou clone"
arch=('i686' 'x86_64')
url="https://taisei-project.org/"
license=('MIT')
depends=('sdl2_mixer' 'sdl2_ttf' 'libzip' 'hicolor-icon-theme')
makedepends=('meson' 'python-docutils')
source=($pkgname-$pkgver.tar.gz::"https://github.com/taisei-project/taisei/archive/v$pkgver.tar.gz")
sha256sums=('8d2d682eeeb6284bc726b8ae52c355848b007957d2dc6bdd973f6384ae075ea3')

build() {
  cd $pkgname-$pkgver
  arch-meson . build
  ninja -C build
}

package() {
  cd $pkgname-$pkgver

  DESTDIR="$pkgdir/" ninja -C build install

  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
