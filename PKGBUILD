# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=makepkg-meta
pkgver=r18.97242c5
pkgrel=1
pkgdesc="Easily create and install custom metapackages"
arch=('any')
url="https://github.com/andrewgregory/makepkg-meta"
license=('MIT')
depends=('bash')
makedepends=('git' 'perl')
source=("$pkgname::git+$url.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"

	sed -i s:'/local':: Makefile
}

build() {
	cd "$srcdir/$pkgname"

	make all
}

package() {
	cd "$srcdir/$pkgname"

	make DESTDIR="$pkgdir/" install
	install -D -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE
}
