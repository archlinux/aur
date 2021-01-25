# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=diff-pdf
pkgver=0.4.1
pkgrel=1
pkgdesc='A simple tool for visually comparing two PDF files'
arch=('x86_64')
url="http://vslavik.github.io/$pkgname"
license=('GPL')
depends=('poppler-glib' 'wxgtk2')
source=("https://github.com/vslavik/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
		remove-cairo.patch)
sha256sums=('0eb81af6b06593488acdc5924a199f74fe3df6ecf2a0f1be208823c021682686'
            '26027109e4e685d5ecf3d733e9b8ab334c54720056a5bcaebd6b1d2e5f6ef65a')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < ../remove-cairo.patch
	aclocal
	autoconf
	automake --add-missing --copy --foreign
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
