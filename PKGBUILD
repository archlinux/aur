# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: mosra <mosra@centrum.cz>

pkgname=magnum
pkgver=2016.05.13
pkgrel=2
pkgdesc='2D/3D graphics engine for C++11/C++14'
arch=('x86_64' 'i686')
url="http://mosra.cz/blog/magnum.php"
license=('MIT')
depends=('libcorrade' 'openal' 'sdl2')
makedepends=('cmake' 'git' 'ninja')
source=("git://github.com/mosra/magnum.git#commit=67bd8a9b9938")
sha1sums=('SKIP')

build() {
  mkdir -p build
  cd build

  cmake "../$pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_AUDIO=ON \
    -DWITH_SDL2APPLICATION=ON \
    -DWITH_GLXAPPLICATION=ON \
    -DWITH_WINDOWLESSGLXAPPLICATION=ON \
    -DWITH_GLXCONTEXT=ON \
    -DWITH_MAGNUMFONT=ON \
    -DWITH_MAGNUMFONTCONVERTER=ON \
    -DWITH_OBJIMPORTER=ON \
    -DWITH_TGAIMAGECONVERTER=ON \
    -DWITH_TGAIMPORTER=ON \
    -DWITH_WAVAUDIOIMPORTER=ON \
    -DWITH_DISTANCEFIELDCONVERTER=ON \
    -DWITH_FONTCONVERTER=ON \
    -DWITH_MAGNUMINFO=ON \
    -GNinja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
