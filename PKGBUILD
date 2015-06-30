# Maintainer: awh

pkgname=mediaextract-git
_gitname="mediaextract"
pkgver=r110.ceb8c01
pkgrel=1
pkgdesc="Extracts media files (AVI, Ogg, Wave, PNG, ...) that are embedded within other files."
arch=('i686' 'x86_64')
url="http://panzi.github.com/mediaextract/"
license=('MIT')
depends=('glibc')
makedepends=('git')
source=('git://github.com/panzi/mediaextract.git')
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	make builddir
	make
}

package() {
	cd "$srcdir/$_gitname"
	make PREFIX="$pkgdir/usr" install
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}
