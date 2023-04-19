# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=xfce4-power-manager
pkgname=${_pkgname}-git
pkgver=4.19.0+2+g6c3e56dc
pkgrel=1
pkgdesc="Power manager for Xfce desktop"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-power-manager/start"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'upower' 'libnotify' 'xfce4-notifyd' 'hicolor-icon-theme' 'networkmanager')
makedepends=('xfce4-panel' 'git' 'xfce4-dev-tools')
optdepends=('xfce4-panel: Xfce panel plugin support')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  cd "${_pkgname}"

  ./autogen.sh \
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
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
}
