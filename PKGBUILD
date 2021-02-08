# Maintainer: sunplan
_pkgname=swf2pdf
pkgname=swf2pdf-git
pkgver=r6.cac7b45
pkgrel=2
pkgdesc='Converts swf files to pdf'
arch=('any')
url='https://github.com/faubi/swf2pdf'
license=('unknown')
depends=('swfdec-devel'
         'cairo'
         'glib2')
makedepends=('git'
             'swfdec-devel'
             'cairo'
             'glib2')
provides=('swf2pdf')
conflicts=('swf2pdf')
source=(
	"$pkgname::git+https://github.com/faubi/swf2pdf.git"
)
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	sed --in-place 's/swfdec-0.8/swfdec-0.9/g' Makefile
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -Dm755 $_pkgname $pkgdir/usr/bin/$_pkgname
	install -Dm644 README.md $pkgdir/usr/share/doc/$_pkgname/README.md
}