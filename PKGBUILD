# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=rp-bookshelf
pkgver=r121.a1ce47b
pkgrel=1
pkgdesc="Browser for Raspberry Pi Press publications in PDF format"
arch=('x86_64')
url="https://github.com/raspberrypi-ui/bookshelf"
license=('BSD')
depends=('glib2' 'gtk3>=3.24' 'libx11' 'intltool' 'libcurl-gnutls')
makedepends=('git')
provides=("rp-bookshelf")
conflicts=("rp-bookshelf")
source=('git+https://github.com/raspberrypi-ui/bookshelf.git'
		'0001-removed-repetitive-macro.patch')
sha256sums=('SKIP'
            '6f0389387e40641044d20c8d8dca9d8bec9f00dae180ef1754126adc732ae9f9')

pkgver() {
  cd "bookshelf"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "bookshelf"
	patch -p1 -i "../0001-removed-repetitive-macro.patch"
}

build() {
	cd "bookshelf"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "bookshelf"
	make -k check
}

package() {
	cd "bookshelf"
	make DESTDIR="$pkgdir/" install
}
