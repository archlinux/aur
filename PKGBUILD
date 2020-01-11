# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfdesktop
pkgname=${_pkgname}-git
pkgver=4.14.0+89+g85368af1
pkgrel=1
pkgdesc="A desktop manager for Xfce (git version)"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui>=4.13.0' 'garcon>=0.6.0' 'hicolor-icon-theme' 'libwnck3' 'thunar')
makedepends=('intltool' 'git' 'xfce4-dev-tools')
conflicts=('xfce4-menueditor' "${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
replaces=('xfce4-menueditor')
options=('!libtool')
source=("${_pkgname}::git://git.xfce.org/xfce/xfdesktop")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-notifications \
    --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
