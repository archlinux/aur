# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=libxfce4ui
pkgname=${_pkgname}-nocsd
pkgver=4.16.0
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
sha256sums=('292ab49b3d08e514ac9283acab0ae43c8159785366aed11730671c33e2f749e4')

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
