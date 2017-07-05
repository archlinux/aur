# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: m4sk1n <m4sk1n@o2.pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

_pkgname=libxfce4ui
pkgname=${_pkgname}-git
pkgver=4.13.3.r5.gb7e544b
pkgrel=1
pkgdesc="Commonly used Xfce widgets among Xfce applications - git checkout"
arch=('i686' 'x86_64')
url="https://git.xfce.org/xfce/libxfce4ui/tree/README"
license=('GPL2')
depends=('libxfce4util' 'gtk2' 'xfconf' 'libsm' 'startup-notification'
         'hicolor-icon-theme' 'gtk3')
makedepends=('intltool' 'gtk-doc' 'xfce4-dev-tools' 'gobject-introspection' 'git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}" "${_pkgname}-devel")
source=("${_pkgname}::git+https://git.xfce.org/xfce/libxfce4ui")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug \
    --with-vendor-info='Arch Linux'
  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
