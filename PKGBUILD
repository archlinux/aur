# Contributor: Lukasz Dobrogowski <lukasz.dobrogowski@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: flacs <0f1ac5@gmail.com>

pkgname=lib32-sdl2_net
pkgver=2.2.0
pkgrel=1
pkgdesc="A small sample cross-platform networking library (Version 2, 32 bit)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_net"
license=('MIT')
depends=("${pkgname#*-}>=$pkgver" 'lib32-sdl2')
makedepends=('gcc-multilib')
source=("$url/release/SDL2_net-${pkgver}.tar.gz")
sha256sums=('4e4a891988316271974ff4e9585ed1ef729a123d22c08bd473129179dc857feb')

build() {
  cd "${srcdir}/SDL2_net-${pkgver}/"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --disable-static --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  make -C SDL2_net-$pkgver DESTDIR="$pkgdir/" install

  # remove header file
  rm -rf "$pkgdir"/usr/include

  # link license
  install -d "$pkgdir"/usr/share/licenses
  ln -s ${pkgname#*-} "$pkgdir"/usr/share/licenses/$pkgname

}
