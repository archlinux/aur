# Maintainer: Andrei Alexeyev <akari@alienslab.net>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Weber <laochailan@web.de>

pkgname=taisei-git
pkgver=1.1.r349.g72bfb7d
pkgrel=1
pkgdesc="Open source Touhou clone (development version)"
arch=('i686' 'x86_64')
url="https://taisei-project.org/"
license=('MIT')
depends=('sdl2_mixer' 'sdl2_ttf' 'libzip' 'hicolor-icon-theme')
provides=('taisei')
conflicts=('taisei')
makedepends=('git' 'meson')
source=(taisei::"git+https://github.com/taisei-project/taisei.git")
md5sums=('SKIP')

pkgver() {
  cd taisei
  git describe --long --tags --match "v[0-9]*[!a-z]" | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd taisei
  mkdir -p build
  cd build
  meson .. --prefix=/usr
  ninja
}

package() {
  cd taisei/build

  DESTDIR="$pkgdir/" ninja install

  # license
  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
