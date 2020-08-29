# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=uberswitch-git
pkgver=r39.1a192a5
pkgrel=1
epoch=
pkgdesc="A header-only, unobtrusive, almighty alternative to the C++ switch statement that looks just like the original."
arch=('x86_64')
url="https://github.com/falemagn/uberswitch"
license=('Unlicense')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$srcdir/$pkgname"

	mkdir -p "$pkgdir/usr/include"
	mv include/${pkgname%-git} "$pkgdir/usr/include/${pkgname%-git}"
}
