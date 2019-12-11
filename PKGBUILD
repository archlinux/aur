# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='libstoragemgmt'
pkgver='1.8.2'
pkgrel='1'
pkgdesc='A library for storage management'
arch=('any')
url="https://github.com/libstorage/${pkgname}"
license=('GPL')
depends=('libxml2' 'icu' 'sqlite' 'openssl' 'libconfig')
makedepends=('check' 'chrpath' 'valgrind' 'python-pywbem')
optdepends=('arcconf: support for Microsemi (Adaptec) controllers')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fb636b9cc3d004578726d915353b1cffe578414c4b4dd5830ee49d562cf0a958')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  autoreconf -fvi
  PYTHON="/usr/bin/python" ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --datarootdir=/usr/share \
    --datadir=/usr/share \
    --with-python3
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/test"
  ./runtests.sh
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
