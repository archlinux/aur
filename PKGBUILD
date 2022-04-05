# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
_pkgname=libretro-database
pkgname=$_pkgname-git
pkgver=1.9.5.r3.g658a2c29
pkgrel=3
epoch=1
pkgdesc="RetroArch's cheatcode files, content data files, etc."
arch=('any')
url="https://github.com/libretro/$_pkgname"
license=('MIT')
groups=('libretro')
makedepends=('git')
optdepends=('retroarch')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
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
