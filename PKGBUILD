# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=retroarch-joypad-autoconfig
pkgname=$_pkgname-git
pkgver=1.10.3.r0.g760b057
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
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	rm -r $_pkgname/{dinput,mfi,qnx,xinput}
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	find . -iname '*.cfg' -type f -exec install -Dm644 {} "$pkgdir"/usr/share/libretro/autoconfig/{} \;
	install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md retropad_layout.png
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname COPYING
}
