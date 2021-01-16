# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-core-info
pkgname=$_pkgname-git
pkgver=1.9.0.r16.g48d954c
pkgrel=1
epoch=1
pkgdesc="Libretro core info files"
arch=('any')
url="https://github.com/libretro/libretro-core-info"
license=('MIT')
groups=('libretro')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
	# copy license
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname COPYING
}
