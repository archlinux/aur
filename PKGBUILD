# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=lcd4linux-svn
_pkgname=lcd4linux
pkgver=r1203
pkgrel=1
pkgdesc="A small program that grabs information from the kernel and some subsystems and displays it on an external liquid crystal display."
arch=('i686' 'x86_64')
url="https://lcd4linux.bulix.org/"
license=('GPLv2')
depends=()
makedepends=('subversion' 'pkg-config' 'automake' 'autoconf')
source=('lcd4linux::svn+https://ssl.bulix.org/svn/lcd4linux/trunk')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build() {
	cd "$srcdir/${_pkgname}"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make DESTDIR="$pkgdir/" install
	install -Dm0644 "$srcdir/../lcd4linux.service" "$pkgdir/usr/lib/systemd/system/lcd4linux.service"
}
