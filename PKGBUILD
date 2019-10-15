# AUR Package Maintainer: f1reflyylmao <f1refy@airmail.cc>
# Author: Fatih Kadir Akın <f@users.noreply.github.com>
pkgname=guardian-noemoji-git
pkgver=v0.0.5.54d535d
pkgrel=2
pkgdesc="This patched version comes without the emoji"
arch=('any')
url="https://github.com/f/guardian"
license=('MIT')
makedepends=('git' 'crystal')
provides=("${pkgname%-noemoji-git}")
conflicts=("${pkgname%-noemoji-git}")
source=('git+https://github.com/f/guardian.git' 'noemoji.patch')
md5sums=('SKIP' 'f7f3063f5c06492064ccc9efa78ce0b4')

pkgver() {
	cd "$srcdir/${pkgname%-noemoji-git}"
	echo $(git describe --long --tags | tr '-' '.')
}

prepare() {
	cd "$srcdir/${pkgname%-noemoji-git}"
	patch -Np1 -i "$srcdir/noemoji.patch"
}

build() {
	cd "$srcdir/${pkgname%-noemoji-git}"
	crystal build --release src/guardian.cr
}

check() {
	cd "$srcdir/${pkgname%-noemoji-git}"
	crystal spec
}

package() {
	cd "$srcdir/${pkgname%-noemoji-git}"
	mkdir -p "$pkgdir/usr/bin/"
	cp "$srcdir/guardian/guardian" "$pkgdir/usr/bin/guardian"
}
