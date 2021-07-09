# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: almostalive <almostalive2003 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-prboom
pkgname=$_pkgname-git
pkgver=r666.2ab3b4a
pkgrel=1
epoch=1
pkgdesc="PrBoom (Doom/Doom II/Final Doom) core"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/libretro-prboom"
license=('GPL2')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	make -C $_pkgname DESTDIR="$pkgdir" install
}
