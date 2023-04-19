# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfdesktop
pkgname=${_pkgname}-devel
pkgver=4.19.1
pkgrel=1
pkgdesc="A desktop manager for Xfce (development release)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://docs.xfce.org/xfce/xfdesktop/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('thunar' 'garcon' 'hicolor-icon-theme' 'libwnck3'
         'libxfce4windowing>=4.19.1' 'gtk-layer-shell')
conflicts=('xfce4-menueditor' "${_pkgname}")
provides=("${_pkgname}=${pkgver}")
replaces=('xfce4-menueditor')
options=('!libtool')
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('b47b49ebf2990aedc640ac5bf3dce6a1ed610a7b05c93d8b69bd272c4b6b77e5')

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
