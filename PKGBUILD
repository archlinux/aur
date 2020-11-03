#Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-volman
pkgname=${_pkgname}-devel
epoch=1
pkgver=4.15.1
pkgrel=1
pkgdesc="automatic management for removeable devices in thunar"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL2')
url="https://goodies.xfce.org/projects/thunar-plugins/thunar-volman"
groups=('xfce4-goodies-devel')
depends=('thunar' 'libxfce4ui' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
options=('!libtool')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('7528cd48d58467411cbcfeacb0e6ac24349952fc3d92d975d0e8fd341d43076b')

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
