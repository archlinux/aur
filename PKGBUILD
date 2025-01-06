# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xfce4-mpc-plugin-update
pkgver=0.5.5
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

sha256sums=('4ce7d77667a263ee9916c0cab2a733b17e3bd65705cd4ed5cec3cbde6e7298cf'
            'b3f59a065178c1d68b0873a2b81055ad77368440b9e3dd1af7d7a1a0d8b0576b')
