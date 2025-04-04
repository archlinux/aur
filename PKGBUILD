# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Contributor: Alexandre Bouvier <contact@amb.tf>
# Contributor: Anthony Wang <ta180m@pm.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-bsnes-jg
pkgname=$_pkgname-git
pkgver=1732.aa6d211
pkgrel=1
pkgdesc="Super Nintendo Entertainment System core"
arch=('aarch64' 'x86_64')
url="https://github.com/libretro/bsnes-jg"
license=('GPL3')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname=1:${pkgver#r}")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	make -C $_pkgname/libretro platform=unix
}

package() {
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro $_pkgname/libretro/bsnes-jg_libretro.so
}
