# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: royrocks <royrocks13@gmail.com>

_pkgname=libpaper
pkgname=lib32-${_pkgname}
pkgver=1.1.24
pkgrel=1
pkgdesc='Library for handling paper characteristics (32-bit)'
arch=('x86_64')
url='http://packages.debian.org/unstable/source/libpaper'
license=('GPL')
depends=('lib32-glibc')
source=("http://ftp.de.debian.org/debian/pool/main/libp/${_pkgname}/${_pkgname}_${pkgver}+nmu4.tar.gz")
md5sums=('155d2e589e2f4ef163de8fbbc5d3dd1e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}+nmu4"

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
  cd "${srcdir}/${_pkgname}-${pkgver}+nmu4"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
