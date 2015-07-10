# maintainer: Magnus Therning <magnus@therning.org>

_pkgname=gencfsm
_pkgmajver=1.8
pkgname=gnome-encfs-manager
pkgver=1.8.14
pkgrel=2
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

sha256sums=('95c43db9ca1b356c450447a9f95f208a0ffe9fdff470acb6d51f2d4d102c3953')
