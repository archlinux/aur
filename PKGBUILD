# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Esa lakaniemi <esalaka@gmail.com>

_pkgbasename=sdl_ttf
pkgname=lib32-$_pkgbasename
pkgver=2.0.10
pkgrel=3
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (32-bit)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_ttf/"
license=('LGPL')
options=('!libtool')
depends=('lib32-sdl' 'lib32-freetype2' $_pkgbasename)
makedepends=('gcc-multilib')
source=(http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-$pkgver.tar.gz)
sha256sums=('7d38704bcc7c34029c2dcb73b2d4857e8ad76341c6e0faed279eb9f743c66c6a')

build() {
  cd "${srcdir}"/SDL_ttf-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32 CC="gcc -m32" PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  make
}

package() {
  cd "${srcdir}"/SDL_ttf-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf "${pkgdir}"/usr/include
}

# vim: sw=2:ts=2 et:
