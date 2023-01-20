# Maintainer: xannode <archpkg _at_ _xannode _dot_com>
# Contributor: awh

pkgname=mediaextract-git
_gitname="mediaextract"
pkgver=r145.00a5c54
pkgrel=1
pkgdesc="Extracts media files (AVI, Ogg, Wave, PNG, ...) that are embedded within other files."
arch=('i686' 'x86_64')
url="https://github.com/panzi/mediaextract"
license=('MIT')
depends=('glibc')
makedepends=('git' 'help2man')
source=('git+https://github.com/panzi/mediaextract.git')
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

#  vim: set ts=8 sw=8 tw=0 noet :
