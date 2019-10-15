# AUR Package Maintainer: f1reflyylmao <f1refy@airmail.cc>
# Author: Fatih Kadir Akın <f@users.noreply.github.com>
pkgname=guardian-git
pkgver=v0.0.5.4.g54d535d
pkgrel=1
pkgdesc="Watches over your files and runs assigned tasks"
arch=('any')
url="https://github.com/f/guardian"
license=('MIT')
makedepends=('git' 'crystal')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/f/guardian.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	echo $(git describe --long --tags | tr '-' '.')
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	crystal build --release src/guardian.cr
}

check() {
	cd "$srcdir/${pkgname%-git}"
	crystal spec
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/bin/"
	cp "$srcdir/guardian/guardian" "$pkgdir/usr/bin/guardian"
}
