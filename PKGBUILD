# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: fzerorubigd <fzero@rubi.gd>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=openage-git
pkgver=0.4.0.r0.g0f8615cbc
pkgrel=1
pkgdesc='A free (as in freedom) clone of the Age of Empires II engine'
arch=(i686 x86_64)
url='http://openage.sft.mx/'
license=(GPL3)
depends=('python' 'libepoxy' 'ftgl' 'sdl2_image' 'opusfile' eigen
         'qt5-declarative' 'xdg-utils' 'sdl2' 'qt5-quickcontrols'
         'libpng'
         'libogg'
         'python-pillow'
         'python-numpy'
         'python-pygments'
         'python-jinja'
         'nyan-lang-git')
makedepends=(git cmake cython doxygen vulkan-headers)
optdepends=('ttf-dejavu: for text display, but you can use any font'
            vulkan-icd-loader)
provides=(openage)
conflicts=(openage)
source=("git+https://github.com/SFTtech/openage")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd "$srcdir/${pkgname/-git/}"
  mkdir -p build
}
build() {
  cd "$srcdir/${pkgname/-git/}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=Release ..
  make
}
package() {
  cd "$srcdir/${pkgname/-git/}/build"
  make DESTDIR="$pkgdir/" install
}
