# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: m4sk1n <m4sk1n vivaldi net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfce4-panel
pkgname=${_pkgname}-git
pkgver=4.15.1+2+g7db1f872
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment - git checkout"
arch=('i686' 'x86_64')
url="http://docs.xfce.org/xfce/xfce4-panel/start"
license=('GPL2')
groups=('xfce4-git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
depends=('exo' 'garcon' 'libxfce4ui>=4.15.1' 'libwnck3' 'hicolor-icon-theme'
         'desktop-file-utils' 'xfconf' 'libxfce4util')
makedepends=('intltool' 'gtk-doc' 'git' 'xfce4-dev-tools' 'gobject-introspection' 'vala')
optdepends=('xfce4-panel-profiles')
source=("${_pkgname}::git://git.xfce.org/xfce/xfce4-panel")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s:-:+:g" #s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-gtk-doc \
    --enable-gtk2 \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="$pkgdir" install
}
