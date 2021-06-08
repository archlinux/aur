# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=openshadinglanguage-qfix
pkgver=1.11.14.0
pkgrel=2
pkgdesc="Advanced shading language for production GI renderers (build against opencolorio=2"
arch=(x86_64)
url="https://github.com/imageworks/OpenShadingLanguage"
license=('custom')
depends=('boost-libs' 'openimageio-qfix' 'imath' 'intel-tbb' 'freetype2' 'libpng'
         'libtiff' 'zlib' 'ncurses' 'clang')
makedepends=('boost' 'cmake' 'python' 'llvm' 'ninja')
optdepends=('python: the Python module')
#provides=(openshadinglanguage)
#conflicts=(openshadinglanguage)
source=($pkgname-$pkgver.tar.gz::https://github.com/imageworks/OpenShadingLanguage/archive/Release-${pkgver}.tar.gz)
sha512sums=('652279db2c0e7435c8e8bef466bf5e92647de3a477c6e652872bc97fc4b4432c9650b302f090beb69d44c9afd0140087a42084c99130f36b5dd750f2beed285d')

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
