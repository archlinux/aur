# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fzerorubigd <fzero@rubi.gd>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=openage
pkgver=0.5.0
pkgrel=1
pkgdesc="A free (as in freedom) clone of the Age of Empires II engine"
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://openage.sft.mx/"
license=(GPL3)
depends=(libepoxy opusfile sdl2 sdl2_image
         qt6-declarative vulkan-icd-loader
         libpng libogg nyan-lang
         python-pillow python-numpy python-toml python-mako
         python-pygments python-lz4

         # namcap implicit depends
         glibc gcc-libs python gperftools harfbuzz fontconfig freetype2
         qt6-base libglvnd opus ncurses)
makedepends=(git cmake cython doxygen vulkan-headers python-graphviz eigen toml11)
optdepends=('ttf-dejavu: for text display, but you can use any font')
source=("git+https://github.com/SFTtech/openage.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cmake -B build -S "openage" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
