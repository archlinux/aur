# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>
# Contributor: Gionn <me[at]gionn[dot]net>

pkgname=upnp-router-control
pkgver=0.2
pkgrel=3
pkgdesc="UPnP Router Control allow to see some params of the router like the download speed and control port forwarding trough UPnP protocol."
url="https://launchpad.net/upnp-router-control"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('gtk2' 'gupnp' 'curl')
makedepends=('intltool')
source=("http://launchpad.net/upnp-router-control/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('60bfd58c56ad2e81144416b718e7c2f5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac
  sed -i 's/AM_PROG_CC_STDC/AC_PROG_CC/g' configure.ac

  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make CFLAGS="$CFLAGS -lm -lgssdp-1.0"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
