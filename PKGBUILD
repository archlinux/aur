# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: m4sk1n <m4sk1n@o2.pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgbase=libxfce4ui
pkgname=(${pkgbase}-git)
pkgver=4.13.3.r26.gbffab34
pkgrel=1
pkgdesc="Commonly used Xfce widgets among Xfce applications (git checkout)"
arch=('i686' 'x86_64')
url="https://git.xfce.org/xfce/libxfce4ui/tree/README"
license=('GPL2')
depends=('libxfce4util>=4.13.0' 'gtk2' 'xfconf' 'libsm' 'startup-notification'
         'hicolor-icon-theme' 'gtk3')
makedepends=('intltool' 'gtk-doc' 'xfce4-dev-tools' 'gobject-introspection' 'git' 'vala')
provides=("${pkgbase}=${pkgver%%.r*}")
conflicts=("${pkgbase}" "${pkgbase}-devel")
source=("${pkgbase}::git://git.xfce.org/xfce/libxfce4ui")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgbase}"
  git describe --long --tags | sed -r "s:^${pkgbase}.::;s/^v//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "${pkgbase}"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug \
    --enable-maintainer-mode \
    --with-vendor-info='Arch Linux'
  make
}

package_libxfce4ui-git() {
  cd "${pkgbase}"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
