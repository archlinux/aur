# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-core-info
pkgname=$_pkgname-git
pkgver=1.9.6.r0.gd07e3cb
pkgrel=1
epoch=1
pkgdesc="Libretro core info files"
arch=('any')
url="https://github.com/libretro/$_pkgname"
license=('MIT')
groups=('libretro')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname COPYING
}
