#Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-volman
pkgname=${_pkgname}-devel
epoch=1
pkgver=4.19.0
pkgrel=1
pkgdesc="automatic management for removeable devices in thunar"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL2')
url="https://goodies.xfce.org/projects/thunar-plugins/thunar-volman"
groups=('xfce4-goodies-devel')
depends=('thunar' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
options=('!libtool')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('576de93713ab012daf0a4c5e23ff1dd2590064778da8b4f0ad6b3ca5bb2557ca')

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
