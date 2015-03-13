# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=idevicerestore-git
epoch=1
pkgver=r497.861f45c
pkgrel=1
pkgdesc="Restore/upgrade firmware of iOS devices"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org"
license=('LGPL3')
depends=('libirecovery-git' 'libimobiledevice-git' 'libplist-git' 'libzip' 'openssl' 'curl')
makedepends=('git')
source=("git://git.sukimashita.com/idevicerestore.git")
md5sums=('SKIP')

pkgver() {
	cd idevicerestore

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd idevicerestore

#	sed -re 's|automake|& --add-missing|' -i autogen.sh
}

build() {
	cd idevicerestore

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd idevicerestore

	make DESTDIR="$pkgdir" install
}
