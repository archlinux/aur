# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xfce4-mpc-plugin-update
pkgver=0.5.2
pkgrel=1
pkgdesc="Updates the toggle button icon depending on what MPD is doing"
arch=(i686 x86_64)
license=('GPL2')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libmpd>=0.16.1')
makedepends=('pkgconfig' 'intltool')
conflicts=('xfce4-mpc-plugin')
replaces=('xfce4-mpc-plugin')
provides=('xfce4-mpc-plugin')
options=(!libtool)
source=(http://archive.xfce.org/src/panel-plugins/xfce4-mpc-plugin/${pkgver%.*}/xfce4-mpc-plugin-${pkgver}.tar.bz2 update.diff)

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

sha256sums=('eefe78b7b6b95312b3a52814b7f632dc92970c1b3e9535de616315749bf67760'
            '97805caee68cbeb070af0af43c0f71203a64eb6828cfd2f040a20c0f61919f87')
