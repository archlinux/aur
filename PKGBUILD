# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Anthony Wang <ta180m@pm.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-shaders-slang
pkgname=$_pkgname-git
pkgver=r1801.b8a7e9e
pkgrel=1
pkgdesc="Collection of shaders for libretro"
arch=('any')
url="https://github.com/libretro/slang-shaders"
# https://github.com/libretro/slang-shaders/issues/150
license=('BSD-3-Clause AND CC0-1.0 AND CC-BY-NC-SA-3.0 AND CC-BY-SA-4.0 AND GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.1-or-later AND LGPL-3.0-or-later AND MIT AND MPL-2.0')
groups=('libretro')
makedepends=('git')
optdepends=('retroarch')
provides=("$_pkgname=${pkgver#r}" 'libretro-shaders')
conflicts=("$_pkgname")
options=('!strip')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd $_pkgname
	rm -- *.{md,py}
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
}
