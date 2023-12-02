# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Sascha Appel <sascha.appel@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>
# Contributor: Andrea De Angelis <andrea.deangelis93@gmail.com>

_pkgname=xfce4-power-manager
pkgname=${_pkgname}-devel
pkgver=4.19.2
pkgrel=1
pkgdesc="Power manager for Xfce desktop"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-power-manager/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4ui' 'upower' 'libnotify' 'xfce4-notifyd' 'hicolor-icon-theme' 'networkmanager')
makedepends=('xfce4-panel')
optdepends=('xfce4-panel: Xfce panel plugin support')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/xfce4-power-manager/${pkgver%.*}/xfce4-power-manager-${pkgver}.tar.bz2")
sha256sums=('2ab6ef1f6e63401b13aa78a70c709a76e6f5dea5e89c3022519f4135bb273170')

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
