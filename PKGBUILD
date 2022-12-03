# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfdesktop
pkgname=${_pkgname}-devel
pkgver=4.17.2
pkgrel=1
pkgdesc="A desktop manager for Xfce (development release)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('thunar>=4.17.10' 'garcon' 'hicolor-icon-theme' 'libwnck3')
makedepends=('intltool')
conflicts=('xfce4-menueditor' "${_pkgname}")
provides=("${_pkgname}=${pkgver}")
replaces=('xfce4-menueditor')
options=('!libtool')
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('e68128dc72924680ed384d32b95e3a18d94a1ec490c05dab43155cac737bcdd1')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-thunarx \
    --enable-notifications \
    --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
