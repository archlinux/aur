# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Baal <weiss.sebastian@gmx.net>
pkgname=theforceengine
pkgver=1.10.000
pkgrel=1
pkgdesc='Modern "Jedi Engine" replacement supporting Dark Forces, mods, and in the future Outlaws.'
arch=('x86_64')
url="https://theforceengine.github.io/"
license=('GPL-2.0-only')
depends=('gcc-libs'
         'glew'
         'glibc'
         'hicolor-icon-theme'
         'libgl'
         'rtaudio'
         'rtmidi'
         'sdl2'
         'sdl2_image')
makedepends=("cmake")
optdepends=('kdialog: display file dialogs using QT'
            'zenity: display file dialogs using GTK')
install="theforceengine.install"
source=("TheForceEngine-$pkgver.tar.gz::https://github.com/luciusDXL/TheForceEngine/archive/refs/tags/v$pkgver.tar.gz"
        "theforceengine.install")
sha256sums=('8f5d7516698ae86064dd593c426e03368a6932e79040b16f58f54b2ae22578f6'
            '5e1c92324e453a21b44d7252b44d8d0a2e057f75050f0387f6fc5b9edee4c023')

build() {
	cmake -B build \
		-S "TheForceEngine-$pkgver" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev \
		-G "Unix Makefiles"
	cmake --build build
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
