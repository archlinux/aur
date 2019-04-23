# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='libstoragemgmt'
pkgver='1.8.0'
pkgrel='1'
pkgdesc='A library for storage management'
arch=('any')
url="https://github.com/libstorage/${pkgname}"
license=('GPL')
depends=('libxml2' 'icu' 'sqlite' 'openssl')
makedepends=('check' 'chrpath' 'valgrind' 'python-pywbem')
optdepends=('arcconf: support for Microsemi (Adaptec) controllers')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('27706d6dacad134602fe97248932372a160c15b4a8514f3f93bc379023d0ca31')

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
