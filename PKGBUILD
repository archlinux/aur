# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: m4sk1n <m4sk1n@o2.pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

_pkgname=libxfce4ui
pkgname="${_pkgname}"-devel
pkgver=4.15.1
pkgrel=1
pkgdesc="Commonly used Xfce widgets among Xfce applications (Development version)"
arch=('i686' 'x86_64')
url="https://git.xfce.org/xfce/libxfce4ui/tree/README"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4util' 'xfconf' 'libsm' 'startup-notification'
         'hicolor-icon-theme' 'gtk3')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'vala' 'glade')
optdepends=('glade: Glade designer plugin')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('e97c937be99a3f8d41706425707859330b16cc369eb6fb37621adbb4afe9ae4d')

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
