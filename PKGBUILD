# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname=pgtcl
_pkgname=Pgtcl
pkgver=2.7.7
pkgrel=1
pkgdesc='Tcl client side interface to PostgreSQL (libpgtcl)'
arch=('x86_64')
url="https://flightaware.github.io/${_pkgname}/"
license=('BSD')
depends=('postgresql' 'postgresql-libs' 'tcl')
conflicts=('pgtcl-ng')
provides=('libpgtcl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/flightaware/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e0f831a98f1e64b004bcabd9aa9b23286eb3a3bf52406427e6b836b5a3bf422a')

build() {
  cd "${_pkgname}-${pkgver}"

  autoreconf
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --with-tcl=/usr/lib/ \
    --with-tclinclude=/usr/include/ \
    --with-postgres-include=/usr/include/postgresql \
    --with-postgres-lib=/usr/lib/postgresql \
    --enable-64bit \
    --enable-threads \
    --enable-shared \
    --disable-rpath

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
