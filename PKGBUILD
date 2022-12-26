# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
_pkgname=libretro-database
pkgname=$_pkgname-git
pkgver=1.14.0.r8.g3e565a4a
pkgrel=1
epoch=1
pkgdesc="RetroArch's cheatcode files, content data files, etc."
arch=('any')
url="https://github.com/libretro/libretro-database"
license=('MIT')
groups=('libretro')
makedepends=('git')
optdepends=('retroarch')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip')
source=("$_pkgname::git+$url.git")
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
