# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=xfce4-power-manager
pkgname=${_pkgname}-git
pkgver=1.7.0+70+gf05d5ee0
pkgrel=1
pkgdesc="Power manager for Xfce desktop"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'upower' 'libnotify' 'hicolor-icon-theme')
optdepends=('xfce4-panel: for the Xfce panel plugin')
makedepends=('intltool' 'xfce4-panel' 'git' 'xfce4-dev-tools')
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
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-network-manager \
    --enable-polkit \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
}
