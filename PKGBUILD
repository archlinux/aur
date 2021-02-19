# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=openshadinglanguage-qfix
pkgver=1.11.11.0
pkgrel=3
pkgdesc="Advanced shading language for production GI renderers (build against opencolorio=2"
arch=(x86_64)
url="https://github.com/imageworks/OpenShadingLanguage"
license=('custom')
depends=('boost-libs' 'openimageio-qfix' 'openexr' 'intel-tbb' 'freetype2' 'libpng'
         'libtiff' 'zlib' 'ncurses' 'clang')
makedepends=('boost' 'cmake' 'python' 'llvm' 'ninja')
optdepends=('python: the Python module')
#provides=(openshadinglanguage)
#conflicts=(openshadinglanguage)
source=($pkgname-$pkgver.tar.gz::https://github.com/imageworks/OpenShadingLanguage/archive/Release-${pkgver}.tar.gz)
sha512sums=('2a5e45255d21edea631cf6fd957eb8516fc87760e16ae4f32c7f732cfb3500f92477ad9b9fbda50bc34e2fc89867d3c7ff0e31ecb815c053dcf77dc226a2681c')

build() {
  cd OpenShadingLanguage-Release-$pkgver

  cmake \
    -B build \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/opt/osl \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_CXX_STANDARD=14 \
    -DLLVM_STATIC=0 \
    -DSTOP_ON_WARNING=OFF \
    -DOpenImageIO_ROOT=/opt/oiio
  ninja -C build
}

package() {
  cd OpenShadingLanguage-Release-$pkgver

  DESTDIR="$pkgdir/" ninja -C build install

  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}

# vim:set ts=2 sw=2 et:
