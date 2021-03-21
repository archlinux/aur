
pkgname=python2-dbus
_pkgname=dbus-python
pkgver=1.2.16
pkgrel=4
pkgdesc="Python2 bindings for DBUS"
url="https://www.freedesktop.org/wiki/Software/DBusBindings"
arch=(x86_64)
license=('GPL' 'LGPL')
depends=('dbus' 'glib2' 'python2' 'python-dbus-common<1.3' 'python-dbus-common>=1.2')
makedepends=('autoconf-archive')
source=(https://dbus.freedesktop.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('11238f1d86c995d8aed2e22f04a1e3779f0d70e587caffeab4857f3c662ed5a4')

prepare() {
  cd $_pkgname-$pkgver
  autoreconf -vfi
}

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr PYTHON_VERSION=2
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share"
  rm -r "${pkgdir}/usr/include"
  rm -r "${pkgdir}/usr/lib/pkgconfig"
}
