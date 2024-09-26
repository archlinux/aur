# Maintainer: Viachaslau Khalikin <viachaslavic'at'outlook'dot'com>

pkgname='freedroidrpg-git'
pkgver=1.0.r9.g85156e288
pkgrel=1
pkgdesc="Isometric 3D role playing game taking place in the future, on Earth (git version)"
url="http://www.freedroid.org"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('python' 'lua53' 'glibc' 'zlib' 'sdl12-compat' 'sdl_mixer' 'sdl_image' 'sdl_gfx' 'libiconv' 'libpng' 'libgl' 'hicolor-icon-theme' 'glew')
makedepends=('git' 'mesa')
optdepends=('espeak-ng-espeak')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("$pkgname::git+https://gitlab.com/freedroid/freedroid-src.git")
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
