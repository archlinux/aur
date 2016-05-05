# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# based on extra/hdf5
# $Id$
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

_pkgname=hdf5
pkgver=1.8.16
pkgname=${_pkgname}-${pkgver}
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="General purpose library and file format for storing scientific data (legacy version)"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'sh')
makedepends=('time')
source=(ftp://ftp.hdfgroup.org/HDF5/current/src/${_pkgname}-${pkgver/_/-}.tar.bz2)
sha1sums=('a7b631778cb289edec670f665d2c3265983a0d53')

build() {
  cd "$srcdir/${_pkgname}-${pkgver/_/-}"

  ./configure --prefix=/opt/${pkgname} --disable-static \
    --enable-hl \
    --disable-threadsafe \
    --enable-linux-lfs \
    --enable-production \
    --with-pic \
    --docdir=/usr/share/doc/hdf5/ \
    --with-pthread=/usr/lib/ \
    --disable-sharedlib-rpath
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver/_/-}"

  make -j1 DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${_pkgname}-${pkgver/_/-}/COPYING" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

