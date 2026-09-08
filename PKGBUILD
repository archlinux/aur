# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname=pgtcl
_pkgname=Pgtcl
pkgver=3.3.0
pkgrel=1
pkgdesc='Tcl client side interface to PostgreSQL (libpgtcl)'
arch=('x86_64')
url="https://flightaware.github.io/${_pkgname}/"
license=('BSD-3-Clause')
depends=('postgresql' 'postgresql-libs' 'tcl')
conflicts=('pgtcl-ng')
provides=('libpgtcl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/flightaware/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('69a89834fd55a87767bdd6fad201c0453ad8f80cebfb40bc8588302dc22cd654')

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
