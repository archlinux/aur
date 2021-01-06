# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fzerorubigd <fzero@rubi.gd>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=openage-git
pkgver=0.4.1.r346.g28fb967ec
pkgrel=2
pkgdesc="A free (as in freedom) clone of the Age of Empires II engine"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://openage.sft.mx/"
license=(GPL3)
depends=(libepoxy ftgl sdl2_image opusfile eigen
         qt5-declarative xdg-utils sdl2 qt5-quickcontrols
         libpng libogg python-pillow python-numpy python-toml
         python-pygments python-jinja nyan-lang-git)
makedepends=(git cmake cython doxygen vulkan-headers python-graphviz)
optdepends=('ttf-dejavu: for text display, but you can use any font'
            vulkan-icd-loader)
provides=(openage)
conflicts=(openage)
source=("git+https://github.com/SFTtech/openage")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd "${srcdir}/${pkgname%-git}"
  install -d build
}
build() {
  cd "${srcdir}/${pkgname%-git}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}
package() {
  cd "${srcdir}/${pkgname%-git}/build"
  make DESTDIR="${pkgdir}/" install
}
