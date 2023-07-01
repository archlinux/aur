# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Preecha Patumchareonpol <yumyai at gmail.com> 

pkgname=podofo-git
pkgver=0.10.1.r2.gadfff1c
pkgrel=1
pkgdesc="A C++ library to work with the PDF file format"
arch=('x86_64')
url="https://github.com/podofo/podofo"
license=(LGPL2.1)
depends=(fontconfig
         freetype2
         libidn
         libjpeg-turbo
         libpng
         libtiff
         libxml2
         lua
         openssl
         zlib)
makedepends=('cmake' 'git')
conflicts=('podofo')
provides=('podofo')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() { 
  cd "${srcdir}/${pkgname}"
  cmake -B build \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D PODOFO_BUILD_TOOLS=True \
    -D PODOFO_HAVE_JPEG_LIB=True \
    -D PODOFO_HAVE_PNG_LIB=True \
    -D PODOFO_HAVE_TIFF_LIB=True
  make -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  make -C build DESTDIR="$pkgdir" install
}
