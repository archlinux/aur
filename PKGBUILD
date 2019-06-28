# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-cpugraph-plugin
pkgname=${_pkgname}-devel
pkgver=1.0.91
pkgrel=1
pkgdesc="CPU graph plugin for the Xfce4 panel"
arch=('i686' 'x86_64')
license=('GPL' 'custom')
url="https://goodies.xfce.org/projects/panel-plugins/xfce4-cpugraph-plugin"
groups=('xfce4-goodies-devel')
depends=('xfce4-panel')
makedepends=('intltool')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/panel-plugins/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('3f5fcde40f0225213b30dbb41ee54507e5ca3145a798d50ea1026a68f5cc727d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
