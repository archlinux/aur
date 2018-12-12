# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: royrocks <royrocks13@gmail.com>

_pkgname=libpaper
pkgname=lib32-${_pkgname}
pkgver=1.1.26
pkgrel=1
pkgdesc='Library for handling paper characteristics (32-bit)'
arch=('x86_64')
url='https://packages.debian.org/unstable/source/libpaper'
license=('GPL')
depends=('lib32-glibc' 'libpaper')
makedepends=('lib32-gcc-libs')
source=("http://ftp.de.debian.org/debian/pool/main/libp/${_pkgname}/${_pkgname}_${pkgver}.tar.gz")
sha256sums=('a6950b67df66a53e974ffe0baec9a52775b909dd2c51497139af2af4e46519b1')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  autoreconf -vfi
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc \
    --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
