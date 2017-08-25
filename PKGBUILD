# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=piper
pkgver=0.2.900
pkgrel=1
pkgdesc='Piper is a GUI interface to ratbagd, the system daemon for configurable mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/piper'
license=('GPL')
depends=('python3' 'python-gobject>=3.0' 'pygtk' 'libratbag>=0.9.900' 'python-evdev')
makedepends=('meson' 'check')
options=(!emptydirs)
source=("https://github.com/libratbag/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2d84c3ff870be2e1ef4901312775e70d7abda7889b433632c2f96ab70fdfb982')

build() {
    cd "${pkgname}-${pkgver}"

	meson builddir --prefix=/usr/
	ninja -C builddir
}

package() {
	cd "${pkgname}-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C builddir install

	# Cleanup
	rm "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
