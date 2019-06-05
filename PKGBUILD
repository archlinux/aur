# Maintainer: Jameson Pugh <imntreal@gmail.com>
pkgname=openzwave
pkgver=1.6
pkgrel=1
pkgdesc="Opensource Z-Wave control"
url="http://www.openzwave.com"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libsystemd')
makedepends=('doxygen')
source=("https://github.com/OpenZWave/open-zwave/archive/v${pkgver}.tar.gz"
        'tixmltext.patch')
sha256sums=('3b11dffa7608359c8c848451863e0287e17f5f101aeee7c2e89b7dc16f87050b'
            '98dfb22e6fb1b3a01eba9cb5dbbe664c1b859ddd9255de14a36b6e17dfa848dd')

prepare() {
  cd "${srcdir}/open-zwave-${pkgver}/cpp/src"
  patch -p0 < "${srcdir}/tixmltext.patch"
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
