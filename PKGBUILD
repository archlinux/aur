# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-weather-plugin
pkgname=${_pkgname}-devel
pkgver=0.9.1
pkgrel=1
pkgdesc="A weather plugin for the Xfce4 panel"
arch=('i686' 'x86_64')
url="https://goodies.xfce.org/projects/panel-plugins/xfce4-weather-plugin"
license=('GPL2')
groups=('xfce4-goodies-devel')
depends=('xfce4-panel' 'libxml2' 'libsoup' 'hicolor-icon-theme' 'upower')
makedepends=('intltool')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=("https://archive.xfce.org/src/panel-plugins/${_pkgname}/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('7cdc18b8df759dee4ceaaf6ce303eff7fda48e247dbc26b78142929213506cfd')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug \
    --enable-upower
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
