# Maintainer:  M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tuan Nguyen 
# Contributor: Farid <farid at archlinux-br dot org>

pkgname=pdfshuffler-git
pkgver=r100.caec35f
pkgrel=5
pkgdesc="Combine and modify PDF documents and thier pages. Python3, GTK3 version."
arch=('any')
url="http://sourceforge.net/projects/pdfshuffler/"
license=('GPL')
depends=('gtk3' 'python-gobject' 'python-cairo' 'poppler-glib' 'python-pypdf2' 'ghostscript')
makedepends=('git')
conflicts=('pdfshuffler')
source=('pdfshuffler-git::git+https://github.com/jeromerobert/pdfshuffler')
md5sums=('SKIP')

pkgver () {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package () {
	cd "$srcdir/$pkgname"
	python setup.py install --prefix=/usr --root="$pkgdir/"
	
	rm -rf "$pkgdir/usr/share/pdfshuffler/icons"
	
	install -Dm 644 "data/hicolor/scalable/apps/pdfshuffler.svg" \
	"$pkgdir/usr/share/icons/hicolor/scalable/apps/pdfshuffler.svg"
		
	for _size in "16x16" "32x32" "48x48" "256x256" ; do
		install -Dm 644 "data/hicolor/$_size/apps/pdfshuffler.png" \
		"$pkgdir/usr/share/icons/hicolor/$_size/apps/pdfshuffler.png"
	done
}
