# Maintainer: Brenden Hoffman <hbrenden@fastmail.com>
# Contributor: Andy Delgado <cuba200611@gmail.com>
pkgname=libretro-np2kai-git
pkgver=1034.3e8fedc
pkgrel=1
pkgdesc="libretro port of the Kai fork of Neko Project 2 (a PC-98 emulator)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://domisan.sakura.ne.jp/article/np2kai/np2kai.html"
license=('MIT')
groups=('libretro')
install=libretro-np2kai-git.install
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git')
provides=('np2kai-libretro-git')
conflicts=('np2kai-libretro-git')

source=('git+https://github.com/AZO234/NP2kai.git')

md5sums=('SKIP')

pkgver() {
	cd "NP2kai"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "NP2kai/sdl"
	make
}

package() {
	install -Dm644 "NP2kai/sdl/np2kai_libretro.so" "${pkgdir}/usr/lib/libretro/np2kai_libretro.so"
	install -Dm644 "NP2kai/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
