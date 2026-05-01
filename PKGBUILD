# Maintainer: capezotte <carana2099@gmail.com>

pkgname=easyseccomp
pkgver=20240405
pkgrel=1
epoch=
pkgdesc="DSL language to write seccomp filters "
arch=(x86_64)
url="https://www.scrivano.org/posts/2021-01-30-easyseccomp/"
license=('GPL-2.0-or-later')
depends=('libseccomp')
makedepends=('git' 'automake')
checkdepends=('bats')
source=("git+https://github.com/giuseppe/easyseccomp#commit=94422be00da71ff44c8ad1fe3455587c62ca29d3?signed")
sha256sums=('8247fb7fde9e5093580c0b58ac46317faeae792879851d16ba6fd8f969b7d904')
validpgpkeys=('AC404C1C0BF735C63FF4D562263D6DF2E163E1EA')

build() {
	cd "$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
