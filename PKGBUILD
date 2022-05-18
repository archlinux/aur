# Maintainer: Chen Jicheng <hi@chenjicheng.com>
pkgname=obs-plugin-input-overlay-git
pkgver=5.0
pkgrel=2
pkgdesc="Show keyboard, gamepad and mouse input on stream"
arch=('x86_64')
url="https://github.com/univrsal/input-overlay"
license=('GPL2')
groups=('obs-plugins')
depends=(
	'obs-studio>=19.0.3'
	'libuiohook'
)
makedepends=(
	'cmake'
	'make'
	'gcc'
	'git'
)
conflicts=(
	'obs-plugin-input-overlay'
	'obs-plugin-input-overlay-bin'
)
source=("git+https://github.com/univrsal/input-overlay.git#branch=master")
md5sums=("SKIP")

build() {
	cd "${srcdir}/input-overlay"
	git submodule update --init --recursive
	cmake .
	make
}

package() {
	cd "${srcdir}/input-overlay"
	mkdir -p "${pkgdir}/usr/lib/obs-plugins/"
	mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/"
	mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/presets/"
	cp "./projects/plugin/input-overlay.so" "${pkgdir}/usr/lib/obs-plugins/"
	cp -R "./projects/plugin/data/locale/" "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/"
	cp -R "./projects/presets/" "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/"
}
