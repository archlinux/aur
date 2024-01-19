# Maintainer: aksr <aksr at t-com dot me>
pkgname=sam-git
pkgver=r473.5d8acb3
pkgrel=1
pkgdesc='An updated version of the sam text editor.'
arch=('i686' 'x86_64')
url='https://github.com/deadpixi/sam'
license=('custom')
makedepends=('git')
source=("$pkgname::git+$url")
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
	make DESTDIR="$pkgdir/usr" install
	install -Dm644 README.rst $pkgdir/usr/share/doc/${pkgname%-*}/README.rst
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
	cd doc; for i in sam.ps se.ps samrc; do
		install -Dm644 $i $pkgdir/usr/share/doc/${pkgname%-*}/$i
	done
}
