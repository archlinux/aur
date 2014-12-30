# Contributor ugaciaka <ugaciaka@gmail.com>
# Contributor tasos latsas <tlatsas2000@gmail.com>
# Contributor Kibbles
# Contributor Deffe
# Maintainer  Chris Sakalis <chrissakalis@gmail.com>
pkgname=conky-nvidia
_pkgname=conky
pkgver=1.9.0
pkgrel=3
pkgdesc='An advanced, highly configurable system monitor for X based on torsmo'
arch=('i686' 'x86_64')
url='http://conky.sourceforge.net/'
license=('custom')
conflicts=('conky')
provides=('conky')
makedepends=('pkg-config')
depends=('libxml2' 'curl' 'wireless_tools' 'libxft' 'libxdamage' 'imlib2' 'libxnvctrl')
optdepends=("nvidia: for the nvidia objects")
backup=('etc/conky/conky.conf' 'etc/conky/conky_no_x11.conf')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.bz2" "net_graph.patch")
md5sums=('d3de615f43aadc98d555e05ad9e902c2'
         'f1154af369010aa29f82f96f07cf64bc')
sha256sums=('baf1b550f135fbfb53e5e286a33aadc03a667d63bf6c4d52ba7637366295bb6f'
            '10700646d5b3d16f6097476487e23539687ae2b1f1b27ea95dd7b5354a55513b')


prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p0 src/conky.c ../net_graph.patch #sf.net #3525356
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-ibm \
		--enable-curl \
		--enable-rss \
		--enable-weather-xoap \
		--enable-imlib2 \
		--disable-lua \
		--enable-wlan \
		--enable-nvidia
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
