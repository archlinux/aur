# Maintainer: ny-a <nyaarch64 at gmail dot com>
# Contributor: Cristian Delgado <cristdelc at gmail dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Dmitrij D. Czarkoff <czarkoff at gmail dot com>

pkgname=re
pkgver=2.0.1
pkgrel=1
pkgdesc="Portable library for real-time communications"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/baresip/re"
license=('BSD')
depends=('openssl' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/baresip/re/archive/v${pkgver}.tar.gz"
        "re-flags.patch")
sha256sums=('43aa439b96aff75fe5768b9f9d49dea97042e42e7647df47b345465763e2f7ed'
            'fb1c3db52d49953dbc689b105b3bf90c86ddbde44fbe2cfcf2f271c02e48d36b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/re-flags.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 docs/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
