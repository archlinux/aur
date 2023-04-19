# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfdesktop
pkgname=${_pkgname}-git
pkgver=4.19.1+138+gbbf702c8
pkgrel=1
pkgdesc="A desktop manager for Xfce (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfdesktop/start"
license=('GPL2')
groups=('xfce4-git')
depends=('thunar' 'garcon' 'hicolor-icon-theme' 'libwnck3'
         'libxfce4windowing>=4.19.1' 'gtk-layer-shell')
makedepends=('git' 'xfce4-dev-tools')
conflicts=('xfce4-menueditor' "${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
replaces=('xfce4-menueditor')
options=('!libtool')
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  cd "${_pkgname}"

  ./autogen.sh \
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
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
