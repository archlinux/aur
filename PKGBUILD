# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-core-info
pkgname=$_pkgname-git
pkgver=1.22.2.r3.gbd81a0b
pkgrel=1
epoch=1
pkgdesc="Libretro core info files"
arch=('any')
url="https://github.com/libretro/libretro-core-info"
license=('MIT')
groups=('libretro')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname COPYING
}
