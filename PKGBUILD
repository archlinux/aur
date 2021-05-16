# Maintainer: 
# Contributor: awh

pkgname=mediaextract-git
_gitname="mediaextract"
pkgver=r142.e0c69a5
pkgrel=1
pkgdesc="Extracts media files (AVI, Ogg, Wave, PNG, ...) that are embedded within other files."
arch=('i686' 'x86_64')
url="https://github.com/panzi/mediaextract"
license=('MIT')
depends=('glibc')
makedepends=('git' 'help2man')
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
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
