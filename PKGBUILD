# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=ms-tpm-20-ref-git
pkgver=r181.f640b4b
pkgrel=1
pkgdesc='Reference implementation of the TCG Trusted Platform Module 2.0 specification'
arch=('x86_64')
url='https://github.com/Microsoft/ms-tpm-20-ref'
license=('BSD')
depends=('openssl')
makedepends=('git' 'autoconf-archive')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname%-git}/TPMCmd"
	./bootstrap
}

build() {
	cd "${pkgname%-git}/TPMCmd"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname%-git}/TPMCmd"
	make DESTDIR="$pkgdir" install
	install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
