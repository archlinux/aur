# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: m4sk1n <m4sk1n@o2.pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

_pkgname=libxfce4ui
pkgname=${_pkgname}-devel
pkgver=4.19.4
pkgrel=1
pkgdesc="Commonly used Xfce widgets among Xfce applications (Development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/libxfce4ui/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4util' 'gtk3' 'xfconf' 'libsm' 'startup-notification'
         'libgtop' 'libepoxy' 'hicolor-icon-theme')
makedepends=('gtk-doc' 'gobject-introspection' 'vala' 'glade' 'xfce4-dev-tools')
optdepends=('glade: Glade designer plugin')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('c873ec46d5dd448df60a8385e029892f85b40ad66200cc3c055ab7156d718796')

build() {
  cd "${_pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk-doc \
    --disable-debug \
    --enable-gladeui2 \
    --with-vendor-info='Arch Linux' \
    --enable-maintainer-mode
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
