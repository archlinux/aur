#Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-volman
pkgname=${_pkgname}-git
epoch=1
pkgver=0.9.0.r1.g143b1a3
pkgrel=1
pkgdesc="automatic management for removeable devices in thunar"
arch=(i686 x86_64)
license=('GPL2')
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-volman"
groups=('xfce4-goodies-git')
depends=('thunar' 'libxfce4ui' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%\.r*}")
options=('!libtool')
source=("${_pkgname}::git://git.xfce.org/xfce/thunar-volman")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s/^${_pkgname}.//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "${srcdir}/${_pkgname}"
  
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
