# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-panel
pkgname=${_pkgname}-devel
pkgver=4.19.2
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment (development release)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-panel/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('exo' 'garcon' 'libxfce4ui' 'xfconf' 'libwnck3'
         'hicolor-icon-theme' 'desktop-file-utils' 'libdbusmenu-gtk3'
         'libxfce4windowing>=4.19.1' 'gtk-layer-shell')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'vala' 'python') #for gdbus-codegen
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" 'xfce4-statusnotifier-plugin')
replaces=('xfce4-statusnotifier-plugin')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('e6e7a7c31d2dcb195468570fd82919c1c820a2522697682a3cc41b4ea6e7d3ef')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
