# maintainer: Magnus Therning <magnus@therning.org>

_pkgname=gencfsm
_pkgmajver=1.8
pkgname=gnome-encfs-manager
pkgver=1.8.19
pkgrel=1
pkgdesc="An easy to use manager and mounter for encfs stashes"
arch=('i686' 'x86_64')
license=('GPL')
depends=('encfs' 'libgee06' 'gtk3' 'libsm' 'libgnome-keyring')
makedepends=('vala' 'intltool')
install=$pkgname.install
url="https://launchpad.net/gencfsm"
changelog=${pkgname}.changelog
source=(https://launchpad.net/${_pkgname}/trunk/${_pkgmajver}/+download/${pkgname}_${pkgver}.tar.xz
       )
sha256sums=('314060eacb5bac934e623295771c064269e2ee45294eee50de7dbb707d43ddc0')

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

