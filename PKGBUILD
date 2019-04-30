# Maintainer: Andrei Alexeyev <akari@alienslab.net>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lukas Weber <laochailan@web.de>

pkgname=taisei
pkgver=1.3
pkgrel=1
pkgdesc="Open source Touhou clone"
arch=('i686' 'x86_64')
url="https://taisei-project.org/"
license=('MIT')
depends=('opengl-driver' 'sdl2_mixer' 'freetype2' 'libpng' 'libwebp' 'libzip' 'hicolor-icon-theme')
makedepends=('meson' 'python-docutils')
source=("https://github.com/taisei-project/taisei/releases/download/v$pkgver/taisei-v$pkgver.tar.xz")
sha256sums=('4d6ede1e8a512eedec76cc9105022b0f5a361d23841ec1607d06a22c170b843a')

prepare() {
  cd $pkgname-v$pkgver
  arch-meson build
}

build() {
  cd $pkgname-v$pkgver
  ninja -C build
}

package() {
  cd $pkgname-v$pkgver

  DESTDIR="$pkgdir/" ninja -C build install

  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
