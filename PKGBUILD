# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=csope-git
pkgver=r329.f2efe38
pkgrel=1
pkgdesc="Fork of cscope (C source code browser), actively maintained"
arch=('x86_64')
url="https://github.com/agvxov/csope"
license=('unknown')
depends=('ncurses' 'readline')
makedepends=('git' 'gcc' 'make' 'flex' 'pkgconf')
provides=('csope')
conflicts=('csope')
source=("csope::git+https://github.com/agvxov/csope.git")
sha256sums=('SKIP')

pkgver() {
	cd csope
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd csope
	make PREFIX=/usr
}

package() {
	cd csope
	make PREFIX=/usr DESTDIR="$pkgdir" install
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
