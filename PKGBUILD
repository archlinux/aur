# Maintainer: Manuel <mdomlop@gmail.com>

_pkgname=flycast
pkgname=$_pkgname-git
pkgver=r5251.1dd006d8
pkgrel=1
pkgdesc='A multi-platform Sega Dreamcast, Naomi and Atomiswave emulator'
arch=('x86_64' 'i686')
url="https://github.com/flyinghead/flycast"
license=('GPL2')
depends=('libgl' 'libzip' 'xxhash' 'zlib' 'alsa-lib')
makedepends=('git' 'cmake' 'python' 'systemd')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

prepare() {
	cd $_pkgname
	git submodule update --init --recursive
}


pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S $_pkgname \
		-DCMAKE_INSTALL_PREFIX='/usr'
	make -C build
}

package() {
	install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
	cd $_pkgname/shell/linux
	install -Dm644 $_pkgname.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
	install -Dm644 $_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
}
md5sums=('SKIP')
