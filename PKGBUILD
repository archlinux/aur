#Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-volman
pkgname=${_pkgname}-devel
epoch=1
pkgver=0.9.2
pkgrel=1
pkgdesc="automatic management for removeable devices in thunar"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://goodies.xfce.org/projects/thunar-plugins/thunar-volman"
groups=('xfce4-goodies-devel')
depends=('thunar' 'libxfce4ui' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
options=('!libtool')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('b944b4299b73d2ca79184922dfea49782e4849f5960e209def71ac700a92ff27')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
