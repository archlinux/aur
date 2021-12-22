# Maintainer: Antonín Dach <dach@protonmail.com>

pkgname=pinephone-toolkit-git
_pkgname=pinephone-toolkit
pkgver=r9.0107cf9
pkgrel=2
pkgdesc='A collection of tools and utility apps for the PINE64 PinePhone.'
arch=(aarch64)
url='https://github.com/Dejvino/pinephone-toolkit'
license=('MIT')
makedepends=('meson' 'git')
depends=()
provides=('pinephone-toolkit')
conflicts=('pinephone-toolkit')
install=
source=('git+https://github.com/Dejvino/pinephone-toolkit.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_pkgname"
	meson -Dprefix="$pkgdir/usr" build
	cd build
	ninja
}

package() {
	cd "$srcdir/$_pkgname/build"
	mkdir -p "$pkgdir/usr/bin"
	ninja install
}

