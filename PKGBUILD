# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=run-git
pkgver=0.0.1.r1.0446d0c
pkgrel=1
pkgdesc="Replace the current terminal with a graphical program"
arch=('i686' 'x86_64')
url="https://gitlab.com/blevy/run"
license=('custom:CC0')
depends=('glibc')
makedepends=('git' 'make')
provides=('run')
source=("$pkgname::git+https://gitlab.com/blevy/run.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
