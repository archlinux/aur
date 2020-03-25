# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=xfce4-screensaver
pkgname=${_pkgname}-git
pkgver=0.1.9+0+g672964e
pkgrel=1
pkgdesc='Screensaver for XFCE Desktop (git checkout)'
url='https://docs.xfce.org/apps/screensaver/start'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('GPL2')
depends=('libxss' 'libxklavier' 'garcon' 'libwnck3' 'python-gobject' 'xfconf' 'dbus-glib')
makedepends=('intltool' 'systemd' 'xfce4-dev-tools' 'exo')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
groups=('xfce4-goodies-git')
source=("git://git.xfce.org/apps/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/-/+/g"
}

build() {
  cd "${_pkgname}"
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
