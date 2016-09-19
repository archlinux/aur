# maintainer: Magnus Therning <magnus@therning.org>

_pkgname=gencfsm
_pkgmajver=1.8
pkgname=gnome-encfs-manager
pkgver=1.8.18
pkgrel=1
pkgdesc="An easy to use manager and mounter for encfs stashes"
arch=('i686' 'x86_64')
license=('GPL')
depends=('encfs' 'libgee06' 'gtk3' 'libsm' 'libgnome-keyring')
makedepends=('vala' 'intltool')
install=$pkgname.install
url="https://launchpad.net/gencfsm"
source=(https://launchpad.net/${_pkgname}/trunk/${_pkgmajver}/+download/${pkgname}_${pkgver}.tar.xz
       )
sha256sums=('b2c1b6d3d5c5cc9af031183fd1223ed60fd8f6c11682d57b75e8a84e0732eee6')
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

