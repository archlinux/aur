# Maintainer: Maintainer: Michael Duell < mail at akurei dot me >
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=complexity
pkgver=1.13
pkgrel=1
pkgdesc="Measure complexity of C source"
url="http://www.gnu.org/software/complexity/"
license=('GPL')
depends=('autogen')
makedepends=('autoconf' 'automake' 'gcc')
arch=('i686' 'x86_64')
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig})
validpgpkeys=("3EEE51D1355B8EC40D9F3122495143D05D0712D1")


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Regenerate src/opts.[ch] from src/opts.def - current upstream source uses
  # newer autogen version than the system one 
  #
  # Adapted from Debian SID package: 
  # http://deb.debian.org/debian/pool/main/c/complexity/complexity_1.13-1.debian.tar.xz
  cd src && autogen opts.def && cd ..

  # Configure
  ./configure --prefix=/usr
  make -j $(nproc)
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

b2sums=('ba1ac80fb018f070b0251fde54a12e359185d92e06049f33c019df558b2d79b362e6604a9b3a9ca44e359896e6c406cc8ef1e5fbc0dc6b1d84967bb1aa5d8aa8'
        'SKIP')
