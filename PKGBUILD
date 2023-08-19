# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fzerorubigd <fzero@rubi.gd>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=openage-git
pkgver=0.4.1.r1397.g3acf3d6b4
pkgrel=1
pkgdesc="A free (as in freedom) clone of the Age of Empires II engine"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://openage.sft.mx/"
license=(GPL3)
depends=(glibc gcc-libs python
         libepoxy sdl2_image opusfile
         qt6-declarative sdl2 vulkan-icd-loader
         libpng libogg python-pillow python-numpy python-toml python-mako
         python-pygments python-jinja nyan-lang) #xdg-utils ftgl
makedepends=(git cmake cython doxygen vulkan-headers python-graphviz python-lz4 eigen toml11)
optdepends=('ttf-dejavu: for text display, but you can use any font')
provides=(openage)
conflicts=(openage)
source=("git+https://github.com/SFTtech/openage")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "openage" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
