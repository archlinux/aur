# Maintainer: Marcel Gazdik <gazdikmarcel[at]gmail[dot]com>

pkgname=libupnp18
_pkgname=libupnp
pkgver=1.8.3
_pkgver=1.8
pkgrel=5
pkgdesc='A separate installation of libupnp 1.8 branch'
url='http://pupnp.sourceforge.net/'
arch=('x86_64')
license=('BSD')
depends=('glibc')
makedepends=('pkgconfig')
source=(https://downloads.sourceforge.net/sourceforge/pupnp/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('9afa0b09faa9ebd9e8a6425ddbfe8d1d856544c49b1f86fde221219e569a308d')

prepare() {
  cd ${_pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/libupnp-${_pkgver} \
    --includedir=/usr/include/${_pkgname}-${_pkgver}
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  install -dm755 ${pkgdir}/usr/lib/pkgconfig/
  ln -sf /usr/lib/${_pkgname}-${_pkgver}/pkgconfig/libupnp.pc ${pkgdir}/usr/lib/pkgconfig/${_pkgname}-${_pkgver}.pc

  install -dm755 ${pkgdir}/etc/ld.so.conf.d/
  echo "/usr/lib/${_pkgname}-${_pkgver}" > ${pkgdir}/etc/ld.so.conf.d/${_pkgname}-${_pkgver}.conf

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}-${_pkgver}"
}



# vim: ts=2 sw=2 et:
