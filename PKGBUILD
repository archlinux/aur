# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=retroarch-joypad-autoconfig
pkgname=$_pkgname-git
pkgver=1.22.0.r24.g739cee1
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
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	# remove non-linux drivers
	rm -r dinput mfi qnx xinput
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	find . -iname '*.cfg' -type f -exec install -Dm644 {} "$pkgdir"/usr/share/libretro/autoconfig/{} \;
	install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md retropad_layout.png
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname COPYING
}
