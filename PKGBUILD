# Maintainer: Manuel <mdomlop@gmail.com>

_pkgname=flycast
pkgname=$_pkgname-git
pkgver=r4192.17274132
pkgrel=1
pkgdesc='A multi-platform Sega Dreamcast, Naomi and Atomiswave emulator'
arch=('x86_64' 'i686')
url="https://github.com/flyinghead/flycast"
license=('GPL2')
depends=('libgl' 'libzip' 'xxhash' 'zlib')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname/shell/linux
	make
}

package() {
	cd $_pkgname/shell/linux
	install -Dm755 nosym-reicast.elf "$pkgdir"/usr/bin/$_pkgname
	install -Dm644 $_pkgname.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
	install -Dm644 $_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
}
