# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=libtpms-git
pkgver=0.7.0.r304.2e2f854
pkgrel=1
pkgdesc='Library providing a software emulation of a Trusted Platform Module (TPM 1.2 and TPM 2.0)'
arch=('x86_64')
url='https://github.com/stefanberger/libtpms'
license=('BSD')
depends=('openssl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	autoreconf --install --force
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --with-openssl --with-tpm2
	make
}

check() {
	cd "${pkgname%-git}"
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
