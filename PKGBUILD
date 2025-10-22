# Maintainer: aksr <aksr at t-com dot me>
pkgname=tg-git
pkgver=r352.c8b313d
pkgrel=1
pkgdesc='A program for timing mechanical watches'
arch=(x86_64)
url='https://github.com/xyzzy42/tg'
license=('GPL-2.0')
depends=('gtk3' 'portaudio' 'fftw')
makedepends=('git')
provides=("${pkgname%-git}" "${pkgname%-*}-timer")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname"
	make -k check
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
