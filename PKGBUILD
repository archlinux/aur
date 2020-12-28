# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=libxfce4ui
pkgname=${_pkgname}-nocsd
pkgver=4.15.8
pkgrel=1
pkgdesc="A fork of libxfce4ui with the explicit goal of removing Client-Side Decorations (CSD)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Xfce-Classic/libxfce4ui-nocsd"
license=('GPL2')
depends=('libxfce4util>=4.15.6' 'xfconf' 'libsm' 'startup-notification'
         'hicolor-icon-theme' 'gtk3' 'libgtop')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'vala' 'glade' 'xfce4-dev-tools')
optdepends=('glade: Glade designer plugin')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('6fa362d67172b76dccdc3b929a0f912747e3af92b5cd4675475cc8b3fed9a7eb')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug \
    --enable-gladeui2 \
    --with-vendor-info='Arch Linux' \
    --enable-maintainer-mode

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
