# Maintainer: Viachaslau Khalikin <viachaslavic'at'outlook'dot'com>

pkgname='freedroidrpg-git'
pkgver=1.0.r9.g85156e288
pkgrel=1
pkgdesc="Isometric 3D role playing game taking place in the future, on Earth (git version)"
url="https://www.freedroid.org"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=(
  glew
  glibc
  hicolor-icon-theme
  libgl
  libpng
  lua53
  python
  sdl12-compat
  sdl_gfx
  sdl_image
  sdl_mixer
  zlib
)
makedepends=('git' 'mesa')
optdepends=('espeak-ng-espeak: to generate the robot taunts')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("$pkgname::git+https://codeberg.org/freedroid/freedroid-src.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/-/.r/;s/-/./'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  make DESTDIR="${pkgdir}" -C "${pkgname}" install
}
