# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fzerorubigd <fzero@rubi.gd>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=openage
pkgver=0.5.3
pkgrel=1
pkgdesc="A free (as in freedom) clone of the Age of Empires II engine"
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://openage.sft.mx/"
license=(GPL3)
depends=(libepoxy opusfile ttf-dejavu
         qt6-declarative qt6-multimedia vulkan-icd-loader
         libpng libogg nyan-lang
         python-pillow python-numpy python-toml python-mako
         python-pygments python-lz4

         # namcap implicit depends
         glibc gcc-libs python gperftools harfbuzz fontconfig freetype2
         qt6-base libglvnd opus ncurses)
makedepends=(git cmake cython  vulkan-headers  eigen toml11) #doxygen  python-graphviz
source=("git+https://github.com/SFTtech/openage.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cmake -B build -S "openage" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure

  cd build
  ./run.py test --run-all-tests
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
