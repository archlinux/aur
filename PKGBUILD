# $Id$
# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=ristretto-git
_pkgname=ristretto
pkgver=0.8.2.r9.g6cc891d
pkgrel=1
pkgdesc='Fast and lightweight picture-viewer for Xfce4 (git version)'
arch=('x86_64' 'i686')
url='http://docs.xfce.org/apps/ristretto/start'
license=('GPL')
depends=('libxfce4ui' 'libexif' 'file')
makedepends=('intltool' 'git' 'xfce4-dev-tools')
optdepends=('librsvg: SVG support'
            'tumbler: thumbnailing support')
provides=('ristretto')
conflicts=('ristretto')
source=(git+"git://git.xfce.org/apps/ristretto")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed -r "s/^${_pkgname}-//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "$_pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-debug
  make
}

package() {
  make -C "$_pkgname" DESTDIR="$pkgdir" install
}

# getver: git.xfce.org/apps/ristretto/plain/NEWS
# vim:set ts=2 sw=2 et:
