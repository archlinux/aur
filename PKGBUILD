# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xf86-video-geode
pkgver=2.11.18
pkgrel=2
pkgdesc='Xorg X11 Geode video driver'
arch=('i686')
url='http://www.x.org'
license=('MIT')
groups=('xorg-drivers')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=20')
conflicts=('xf86-video-geode-git' 'X-ABI-VIDEODRV_VERSION<20' 'X-ABI-VIDEODRV_VERSION>=21')
validpgpkeys=('C89002C77A8BEC6A4E6D7390AE1F8277C4B4D7B6')
source=("http://xorg.freedesktop.org/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('d6ece9a862a68be3cdf86a87e0e1ba5e199168b8d075129646638f53649ba9e8'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	./configure \
		--prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}/" install

	install -d "${pkgdir}/etc/modules-load.d/"
	echo "# The Xorg Geode driver requires msr module to be loaded...\nmsr" \
		> "${pkgdir}/etc/modules-load.d/${pkgname}.conf"
}

