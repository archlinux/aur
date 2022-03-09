# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-jumpnbump
pkgname=$_pkgname-git
pkgver=0.1.r24.gc55c379
pkgrel=1
pkgdesc="Jump 'n Bump core"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/jumpnbump-libretro"
license=('GPL2')
groups=('libretro')
depends=('glibc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
