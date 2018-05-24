# Maintainer: Jameson Pugh <imntreal@gmail.com>
pkgname=openzwave
pkgver=1.5
pkgrel=2
pkgdesc="Opensource Z-Wave control"
url="http://www.openzwave.com"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libsystemd')
makedepends=('doxygen')
source=("https://github.com/OpenZWave/open-zwave/archive/V${pkgver}.tar.gz"
        'usercode.patch')
sha256sums=('abfb4c7e7728e86ba374c2e0ef7de912594eb24a8c44935457352df844530238'
            '10d1c748d073a2bd9ce626536153e932e81f272af4bbf2f7943267b54b32bd5f')

prepare() {
  cd "${srcdir}/open-zwave-${pkgver}"
  patch -p1 < ../usercode.patch
}

build() {
  cd "${srcdir}/open-zwave-${pkgver}"
  make
}

package() {
  cd "${srcdir}/open-zwave-${pkgver}"
  make DESTDIR=${pkgdir} PREFIX=/usr instlibdir=usr/lib/ sysconfdir=etc/${pkgname} install
}

# vim:set ts=2 sw=2 et:
