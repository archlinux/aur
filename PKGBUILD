# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=keylightc-git
pkgver=r94.6336fee
pkgrel=1
pkgdesc="Daemon for Framework laptops to handle keyboard backlight controls"
arch=('x86_64')
url="https://gitlab.com/mamarley/keylightc"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname::-4}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname::-4}"
	sed -i 's/$(CFLAGS)/$(CFLAGS) $(LDFLAGS)/g' Makefile
}

build() {
	cd "$srcdir/${pkgname::-4}"
	make
}

package() {
	cd "$srcdir/${pkgname::-4}"
	make DESTDIR="$pkgdir/" install
}
