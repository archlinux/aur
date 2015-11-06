# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Weber <laochailan@web.de>

pkgname=taisei-git
pkgver=1.0a.r120.g732a016
pkgrel=1
pkgdesc="Open source Touhou clone (development version)"
arch=('i686' 'x86_64')
url="http://taisei-project.org/"
license=('MIT')
depends=('sdl_ttf' 'hicolor-icon-theme' 'libgl' 'libpng' 'freealut' 'glu')
provides=('taisei')
conflicts=('taisei')
makedepends=('git' 'cmake' 'mesa')
install=taisei.install
source=(taisei::"git+https://github.com/laochailan/taisei.git")
md5sums=('SKIP')

pkgver() {
  cd taisei
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd taisei

  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd taisei

  make DESTDIR="$pkgdir/" install
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
