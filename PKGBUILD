# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfdesktop
pkgname=${_pkgname}-devel
pkgver=4.19.2
pkgrel=1
pkgdesc="A desktop manager for Xfce (development release)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://docs.xfce.org/xfce/xfdesktop/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('thunar' 'garcon' 'hicolor-icon-theme' 'libxfce4windowing>=4.19.3' 'gtk-layer-shell')
conflicts=('xfce4-menueditor' "${_pkgname}")
provides=("${_pkgname}=${pkgver}")
replaces=('xfce4-menueditor')
options=('!libtool')
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('7cdf2cc37ef50221ded9a49f809180159c441d43d26e630a327283b3992e3e0f')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --enable-thunarx \
    --enable-notifications \
    --enable-wayland \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
