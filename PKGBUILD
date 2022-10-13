# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Maintainer: Niko Cantero <vextium at gmail dot com>
# (Added from libxfce4util package)
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias@archlinux.org>

_pkgname=libxfce4util
pkgname="${_pkgname}-git"
pkgver=4.17.2.r22.ge2f2a6e
pkgrel=1
pkgdesc="Basic utility non-GUI functions for Xfce"
arch=(i686 x86_64)
url=http://gitlab.xfce.org/xfce/${_pkgname}/
license=(GPL2)
groups=(xfce4-git)
depends=(glib2)
makedepends=('git' 'xfce4-dev-tools' 'gobject-introspection' 'vala')
provides=(${_pkgname-git}=${pkgver%+*})
conflicts=(${_pkgname%})
source=(git+https://gitlab.xfce.org/xfce/${_pkgname})
sha256sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    git describe | sed 's/^libxfce4util-//;s/-/.r/;s/-/./g'
}

build() {
  cd ${srcdir}/${_pkgname}

  ./autogen.sh \
      --prefix=/usr \
      --sysconfdir=/etc \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --disable-static \
      --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
