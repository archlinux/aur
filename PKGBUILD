# Maintainer: hashworks <mail@hashworks.net>
pkgname=pam-ihosts-git
pkgver=r33.24f61b1
pkgrel=2
pkgdesc="A PAM module that provides access control by ip, mac-address, or country-code/region."
arch=("any")
url="https://github.com/ColumPaget/pam_ihosts"
license=("GPL3")
depends=("pam" "libffi")
makedepends=("git" "gcc" "binutils")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
