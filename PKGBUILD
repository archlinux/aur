# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=piper
pkgver=0.2.901
pkgrel=1
pkgdesc='Piper is a GUI interface to ratbagd, the system daemon for configurable mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/piper'
license=('GPL')
depends=('python3' 'python-gobject>=3.0' 'libratbag>=0.9.900' 'python-evdev' 'python-lxml' 'python-cairo')
makedepends=('meson')
options=(!emptydirs)
source=("https://github.com/libratbag/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3d1dacd0a4194a1afa4beebf76ad5d85d5a6407c613fba1fcd2274b217dde01a')

build() {
    cd "${pkgname}-${pkgver}"

	# We don't need this
	sed -i -e "/meson.add_install_script('meson_install.sh')/d" meson.build

	meson builddir --prefix=/usr/
	ninja -C builddir
}

package() {
	cd "${pkgname}-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C builddir install
}
