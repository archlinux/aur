# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Anthony Wang <ta180m@pm.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-shaders-slang
pkgname=$_pkgname-git
pkgver=r1257.755b4bb
pkgrel=1
pkgdesc="Collection of shaders for libretro"
arch=('any')
url="https://github.com/libretro/slang-shaders"
license=('BSD' 'CCPL' 'GPL2' 'GPL3' 'LGPL2.1' 'LGPL3' 'MIT' 'MPL2' 'Unlicense')
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
