# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=xfce4-screensaver
pkgname=${_pkgname}-git
pkgver=0.1.10+34+g575a042
pkgrel=1
pkgdesc='Screensaver for XFCE Desktop (git checkout)'
url='https://docs.xfce.org/apps/screensaver/start'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL2')
depends=('libxss' 'libxklavier' 'garcon' 'libwnck3' 'python-gobject' 'xfconf' 'dbus-glib')
makedepends=('intltool' 'systemd' 'xfce4-dev-tools' 'exo')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
groups=('xfce4-goodies-git')
source=("${_pkgname}::git+https://gitlab.xfce.org/apps/${_pkgname}")
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
