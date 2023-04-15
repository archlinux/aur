# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >

pkgname=diff-pdf
pkgver=0.5.1
pkgrel=1
pkgdesc='A simple tool for visually comparing two PDF files'
arch=(x86_64)
url="http://vslavik.github.io/$pkgname"
_url="https://github.com/vslavik/$pkgname"
license=(GPL)
depends=(poppler-glib
         wxwidgets-gtk3)
makedepends=(wxwidgets-common)
_archive="$pkgname-$pkgver"
source=("$_url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('017d52cb7ddabdbf63c6a47f39b2e5a1790022b95295b0d047817904e093245c')

prepare() {
	cd "$_archive"
	./bootstrap
	# Use /usr/share/aclocal/wxwin.m4 from wxwidgets-common
	rm -f admin/wxwin.m4
	cp /usr/share/aclocal/wxwin.m4 admin
}

build() {
	cd "$_archive"
	./configure --prefix /usr \
		--with-wx-config=wx-config
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}
