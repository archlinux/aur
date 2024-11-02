# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Sascha Appel <sascha.appel@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>
# Contributor: Andrea De Angelis <andrea.deangelis93@gmail.com>

_pkgname=xfce4-power-manager
pkgname=${_pkgname}-devel
pkgver=4.19.4
pkgrel=3
pkgdesc="Power manager for Xfce desktop"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-power-manager/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4ui' 'libxfce4util>=4.19.2' 'upower' 'libnotify' 'xfce4-notifyd' 'hicolor-icon-theme' 'networkmanager')
makedepends=('xfce4-panel' 'wayland' 'wayland-protocols' 'glib2-devel' 'wlr-protocols')
optdepends=('xfce4-panel: Xfce panel plugin support')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/xfce4-power-manager/${pkgver%.*}/xfce4-power-manager-${pkgver}.tar.bz2")
sha256sums=('8980a2a844d51f78ebe55ecf5c828a9120ff776665680dcb2598a05696bc9cd2')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-network-manager \
    --enable-polkit \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
