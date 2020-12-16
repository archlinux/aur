# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='libstoragemgmt'
pkgver='1.8.8'
pkgrel='1'
pkgdesc='A library for storage management'
arch=('any')
url="https://github.com/libstorage/${pkgname}"
license=('LGPL')
depends=('libxml2' 'icu' 'sqlite' 'openssl' 'libconfig' 'systemd')
makedepends=('check' 'chrpath' 'valgrind' 'python-pywbem' 'procps-ng')
optdepends=('arcconf: support for Microsemi (Adaptec) controllers')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('493fcfc52aa2811b9417a10f9f1b5b67d7810ea2efe0bcc1b60c7f96e22c9e81')

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
