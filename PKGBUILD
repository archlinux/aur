# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-weather-plugin
pkgname=${_pkgname}-git
pkgver=0.9.0+20+ga6f06d1
pkgrel=1
pkgdesc="A weather plugin for the Xfce4 panel"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-weather-plugin"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libxml2' 'libsoup' 'hicolor-icon-theme' 'upower')
makedepends=('intltool' 'xfce4-dev-tools' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
source=("${_pkgname}::git://git.xfce.org/panel-plugins/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s:-:+:g" #s/^v//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh \
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
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
