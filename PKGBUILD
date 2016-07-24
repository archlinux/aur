# Maintainer: Beini <bane AT iki dot fi>

pkgname=jk2mv
pkgver=1.2.1
pkgrel=1
pkgdesc="Modification for Jedi Knight II: Jedi Outcast."
arch=('i686' 'x86_64')
url="https://jk2mv.org"
license=('GPL')
depends=('libgl' 'openal' 'zlib' 'sdl2' 'curl' 'libpng' 'libjpeg' 'glu')
makedepends=('cmake' 'yasm')
source=("https://github.com/mvdevs/$pkgname/archive/$pkgver.tar.gz"
        'jk2mv.install')
install=jk2mv.install
sha256sums=('71e4a42374ef502e5bea08f44d4b1c1b3a74fbbc66c33acb074599e44abecabb'
            '8873237a7c6f12a0347b3e44cb237110ba526603e2b64aa4914bf4845be477c2')
build() {
  cd "${srcdir}/$pkgname-$pkgver"

  cd build
  cmake -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUseInternalPNG=OFF \
    -DUseInternalJPEG=OFF \
    -DUseInternalZLIB=OFF \
    -DBuildPortableVersion=OFF \
    ..
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver/build/"

  make DESTDIR="${pkgdir}" install

}

# vim: set ts=2 sw=2 ft=sh et:
