# maintainer: Magnus Therning <magnus@therning.org>

_pkgname=gencfsm
_pkgmajver=1.8
pkgname=gnome-encfs-manager
pkgver=1.8.15
pkgrel=1
pkgdesc="An easy to use manager and mounter for encfs stashes"
arch=('i686' 'x86_64')
license=('GPL')
depends=('encfs' 'libgee06' 'gtk3' 'libsm' 'libgnome-keyring')
makedepends=('vala' 'intltool')
install=$pkgname.install
url="https://launchpad.net/gencfsm"
source=(https://launchpad.net/${_pkgname}/trunk/${_pkgmajver}/+download/${pkgname}_${pkgver}.tar.gz
       )
changelog=${pkgname}.changelog

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/$pkgname --disable-appindicator
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}

sha256sums=('bd82d5c61903050d1ccea2180ef38292b7c394634ae6b95421caf0e74ca43ec7')
