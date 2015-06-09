# maintainer: Magnus Therning <magnus@therning.org>

_pkgname=gencfsm
_pkgmajver=1.8
pkgname=gnome-encfs-manager
pkgver=1.8.13
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

sha256sums=('30caf0c9a6da97a143033cd78933b49f7704655f65dd9cde9a03d0a8432b01e6')
