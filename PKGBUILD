#Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-volman
pkgname=${_pkgname}-devel
epoch=1
pkgver=0.9.3
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
sha256sums=('29309091db8b0f08c5a727625cc470673134977d7966cae0392f131300f9d5e9')

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
