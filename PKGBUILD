# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=retroarch-joypad-autoconfig
pkgname=$_pkgname-git
pkgver=r1726.86668ba
pkgrel=1
pkgdesc="RetroArch joypad autoconfig files"
arch=('any')
url="https://github.com/libretro/retroarch-joypad-autoconfig"
license=('MIT')
groups=('libretro')
makedepends=('git')
optdepends=('retroarch')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
	# remove unsupported drivers on linux
	rm -rf "$pkgdir"/usr/share/libretro/autoconfig/{dinput,qnx,xinput}
	# copy license
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname COPYING
}
