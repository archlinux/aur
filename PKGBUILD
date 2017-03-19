# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Weber <laochailan@web.de>

pkgname=taisei-git
pkgver=1.0a.r463.g67128fa
pkgrel=1
pkgdesc="Open source Touhou clone (development version)"
arch=('i686' 'x86_64')
url="http://taisei-project.org/"
license=('MIT')
depends=('sdl2_mixer' 'sdl2_ttf' 'libgl' 'libpng')
provides=('taisei')
conflicts=('taisei')
makedepends=('git' 'cmake' 'mesa')
source=(taisei::"git+https://github.com/laochailan/taisei.git")
md5sums=('SKIP')

pkgver() {
  cd taisei
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd taisei

  cmake ./ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd taisei

  make DESTDIR="$pkgdir/" install
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
