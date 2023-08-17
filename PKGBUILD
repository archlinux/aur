# Maintainer: aksr <aksr at t-com dot me>
pkgname=nextvi-git
pkgver=r649.ab7042d
pkgrel=1
pkgdesc='Next version of neatvi (a small vi/ex editor) for editing bidirectional UTF-8 text'
arch=('i686' 'x86_64')
url='https://github.com/kyx0r/nextvi'
license=('ISC')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's!bin/vi!bin/'${pkgname%-*}'!g' build.sh
}

build() {
	cd "$srcdir/$pkgname"
	./build.sh
}

package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir/" PREFIX=usr ./build.sh install
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}
