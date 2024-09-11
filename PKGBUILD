# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>
# Contributor: Igor <f2404@yandex.ru>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Pablo Lezaeta <prflr arro'a gmail puntocom> (I tryed)
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Diego Principe <cdprincipeat gmaildot com>
# Contributor: Jan Jezek <honzin.jezek@gmail.com>
# Contributor: Berseker <berseker86 at gmail dot com>

_pkgname=exo
pkgname="${_pkgname}-git"
pkgver=4.19.0.r23.g804f7656
pkgrel=1
pkgdesc="Extensions to Xfce originally developed by os-cillation."
arch=('i686' 'x86_64')
license=('LGPL-2.1-only')
url="https://gitlab.xfce.org/xfce/exo/"
groups=('xfce4-git')
provides=("${_pkgname}=${pkgver%%.r*}")
depends=('libxfce4ui' 'libxfce4util')
makedepends=('git' 'glib2-devel' 'xfce4-dev-tools')
conflicts=("$_pkgname")
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}.git")
options=('!libtool')
md5sums=('SKIP')
epoch=2

pkgver(){
  cd "${_pkgname}"
  git describe --long --tags | sed "s/^${_pkgname}-//g;s/\([^-]*-g\)/r\1/;s/-/./g"

}

build() {
  cd "${_pkgname}"

  #./autogen.sh --help=recursive
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var  \
    --disable-static \
    --enable-gtk-doc \
    --enable-debug=minimum \
    --enable-maintainer-mode
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
