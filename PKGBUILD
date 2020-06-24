# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: almostalive <almostalive2003 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-prboom
pkgname=$_pkgname-git
pkgver=r630.9cbbebe
pkgrel=1
epoch=1
pkgdesc="Port of prboom to libretro - plays Doom, Doom II, Final Doom and other Doom IWAD mods"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-prboom"
license=('GPL2')
groups=('libretro')
depends=('libretro-core-info' 'glibc')
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
	cd $_pkgname
	make
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
}
