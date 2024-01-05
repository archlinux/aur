# Maintainer: Baal <weiss.sebastian@gmx.net

pkgname=theforceengine
pkgver=1.09.540
pkgrel=1
pkgdesc='Modern "Jedi Engine" replacement supporting Dark Forces, mods, and in the future Outlaws.'
arch=('x86_64')
url="https://theforceengine.github.io/"
license=('GPL2')
depends=('glew'
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
sha256sums=('ccb7fa9728deb24af5cef04dc9da7afb1f65f532929d02536720d7bd322dc0a0'
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
	make DESTDIR="$pkgdir" install
}
