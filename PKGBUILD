# Maintainer: houkime <houkime at protonmail.com>

pkgname=guile-sdl2-git
pkgver=0.4.0.r11.g1c6a625
pkgrel=1
pkgdesc='Guile Scheme bindings for SDL2'
arch=(any)
license=(LGPL3)
depends=('guile>=2.1.4' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
provides=('guile-sdl2')
conflicts=('guile-sdl2')
url=https://dthompson.us/projects/guile-sdl2.html
source=("${pkgname}"'::git://git.dthompson.us/guile-sdl2.git')
md5sums=('SKIP')

pkgver(){
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build(){
  cd "$srcdir/$pkgname"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install
}