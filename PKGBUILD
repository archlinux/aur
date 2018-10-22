# Maintainer: Andrei Alexeyev <akari@alienslab.net>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Weber <laochailan@web.de>

pkgname=taisei-git
pkgver=1.2.r207.g1fd1b667
pkgrel=1
pkgdesc="Open source Touhou clone (development version)"
arch=('i686' 'x86_64')
url="https://taisei-project.org/"
license=('MIT')
depends=('libpng' 'libwebp' 'sdl2_mixer' 'freetype2' 'libzip' 'hicolor-icon-theme')
provides=('taisei')
conflicts=('taisei')
makedepends=('git' 'meson' 'python-docutils')
source=(taisei::"git+https://github.com/taisei-project/taisei.git")
md5sums=('SKIP')

pkgver() {
  cd taisei
  git describe --long --tags --match "v[0-9]*[!a-z]" | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd taisei
  arch-meson . build
  ninja -C build
}

package() {
  cd taisei

  DESTDIR="$pkgdir/" ninja -C build install

  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
