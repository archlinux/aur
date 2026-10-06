# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=csope-git
pkgver=r330.7a51cba
pkgrel=1
pkgdesc="Fork of cscope (C source code browser), actively maintained"
arch=('x86_64')
url="https://github.com/agvxov/csope"
license=('BSD-4-Clause')
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
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -d "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 documentation/BUGS.md "$pkgdir/usr/share/doc/$pkgname/BUGS.md"
	install -Dm644 documentation/HISTORY.md "$pkgdir/usr/share/doc/$pkgname/HISTORY.md"
	install -Dm644 documentation/TODO.md "$pkgdir/usr/share/doc/$pkgname/TODO.md"
	install -Dm644 documentation/dev_man.md "$pkgdir/usr/share/doc/$pkgname/dev_man.md"
	install -Dm644 documentation/MASTERSCOPE.pdf "$pkgdir/usr/share/doc/$pkgname/MASTERSCOPE.pdf"
	install -Dm644 documentation/dwh-cscopeFormat.txt "$pkgdir/usr/share/doc/$pkgname/dwh-cscopeFormat.txt"
	install -d "$pkgdir/usr/share/$pkgname/scripts"
	install -Dm644 scripts/emacs.e "$pkgdir/usr/share/$pkgname/scripts/emacs.e"
	install -Dm644 scripts/gmacs.ml "$pkgdir/usr/share/$pkgname/scripts/gmacs.ml"
	cp -r scripts/pycscope "$pkgdir/usr/share/$pkgname/scripts/"
	install -Dm644 scripts/pycscope/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pycscope"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
