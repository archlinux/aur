# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=deepin-pdfium-git
_pkgname=deepin-pdfium
pkgver=1.5.3.r3.g1518dd6
pkgrel=1
pkgdesc='Development library for pdf on Deepin'
arch=('x86_64')
url="https://github.com/linuxdeepin/deepin-pdfium"
license=('LGPL3')
depends=('qt5-base' 'openjpeg2' 'libchardet' 'lcms2' 'libjpeg-turbo' 'icu' 'zlib' 'gcc-libs'
         'freetype2')
makedepends=('git' 'cmake' 'ninja' 'qt5-tools')
conflicts=($_pkgname)
provides=($_pkgname)
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/deepin-pdfium")
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  cmake -S . -B build -G Ninja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd $srcdir/$_pkgname
  DESTDIR="$pkgdir" ninja -C build install
}

