# Maintainer: Jashank Jeremy <arch-aur at jashankj dot space>

pkgname=libxo
pkgver=1.3.1
pkgrel=1
pkgdesc='a library for generating text, XML, JSON, and HTML output'
arch=('x86_64')
url='https://github.com/juniper/libxo'
license=('BSD')
groups=()
depends=()
makedepends=('git')
provides=('libxo')
conflicts=('libxo-git')
replaces=()
backup=()
options=()
install=
source=("git+${url}.git#tag=${pkgver}")
noextract=()
md5sums=('SKIP')

pkgver() {
	git -C "$srcdir/${pkgname%-git}" describe --tags
}

build() {
	cd "$srcdir/${pkgname%-git}"
	sh ./bin/setup.sh
	sh ./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
