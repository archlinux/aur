# Maintainer: aksr <aksr at t-com dot me>
pkgname=mujs-git
pkgver=r757.0df0707
pkgrel=1
pkgdesc='A lightweight Javascript interpreter designed for embedding in other software to extend them with scripting capabilities.'
arch=('i686' 'x86_64')
url="http://mujs.com/"
license=('ISC')
makedepends=('git')
depends=('glibc' 'readline');
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+git://git.ghostscript.com/mujs.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" prefix="/usr" install
	install -D -m644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
	cd docs/; for i in *; do
		install -D -m644 $i $pkgdir/usr/share/doc/${pkgname%-*}/$i
	done
}
