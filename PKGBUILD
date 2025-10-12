# Maintainer: aksr <aksr at t-com dot me>
pkgname=spit-git
pkgver=r10.ea0786e
pkgrel=1
pkgdesc='Atomically create a file with content'
arch=(x86_64)
url='https://github.com/leahneukirchen/spit'
license=('public-domain')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	make
}

package() {
	cd "$srcdir/${pkgname}"
	install -D -m755 spit $pkgdir/usr/bin/spit
	install -D -m644 spit.1 "$pkgdir/usr/share/man/man1/spit.1"
}
