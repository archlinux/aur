# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=libxfce4windowing
pkgname=${_pkgname}-git
pkgver=4.19.3+49+ga9b4ff4
pkgrel=1
pkgdesc="Windowing concept abstraction library for X11 and Wayland (git checkout)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/libxfce4windowing/start"
license=('LGPL2.1')
groups=('xfce4-git')
depends=('libwnck3' 'wayland')
makedepends=('gtk-doc' 'gobject-introspection' 'xfce4-dev-tools' 'git' 
             'wayland-protocols' 'wlr-protocols')
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
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-wayland \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="$pkgdir" install
}
