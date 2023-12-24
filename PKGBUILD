# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xfce4-mpc-plugin-update
pkgver=0.5.3
pkgrel=1
pkgdesc="Updates the toggle button icon depending on what MPD is doing"
arch=(i686 x86_64)
license=('GPL2')
url="https://docs.xfce.org/panel-plugins/xfce4-mpc-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libmpd')
makedepends=('pkgconfig' 'intltool')
conflicts=('xfce4-mpc-plugin')
replaces=('xfce4-mpc-plugin')
provides=('xfce4-mpc-plugin')
options=(!libtool)
source=(https://archive.xfce.org/src/panel-plugins/xfce4-mpc-plugin/${pkgver%.*}/xfce4-mpc-plugin-${pkgver}.tar.bz2 update.diff)

build() {
  cd "${srcdir}"/xfce4-mpc-plugin-${pkgver}
  patch -Np1 -i ../update.diff
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static
  make
}

package() {
	cd "${srcdir}"/xfce4-mpc-plugin-${pkgver}
	make DESTDIR="${pkgdir}" install
}

sha256sums=('0467fb4d1acd982d3c3e0b89cb41019946850524ff19ed0f658a8d56c7b7664d'
            'b3f59a065178c1d68b0873a2b81055ad77368440b9e3dd1af7d7a1a0d8b0576b')
