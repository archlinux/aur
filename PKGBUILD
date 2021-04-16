# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=sdl2_image-minimal-git
pkgver=2.0.5
pkgrel=1
pkgdesc="A simple library to load images of various formats as SDL surfaces (Version 2)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_image"
license=('MIT')
depends=('sdl2' 'libpng' 'libtiff' 'libjpeg')
makedepends=('cmake' 'git')
provides=(sdl2_image)
conflicts=(sdl2_image)
source=(git+https://github.com/libsdl-org/SDL_image)
sha512sums=('SKIP')

pkgver() {
  cd SDL_image
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd SDL_image

  ./autogen.sh
  ./configure --disable-static --prefix=/usr \
    --disable-jpg-shared \
    --disable-png-shared \
    --disable-tif-shared \
    --disable-webp-shared \
    --disable-webp \
    --disable-webpdec
  make
}

package() {
  cd SDL_image

  make DESTDIR="${pkgdir}/" install
 # install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
