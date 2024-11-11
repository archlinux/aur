# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>
# Contributor: Josh Cartwright <joshc@eso.teric.us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=sparse-git
pkgver=0.6.4.r66.g0196afe1
pkgrel=1
pkgdesc='A semantic parser for C, parsing most of ANSI C as well as many GCC extensions, [also] including a static analyzer.'
arch=('i686' 'x86_64')
url="http://sparse.wiki.kernel.org/"
license=('custom:MIT')
depends=('perl' 'libxml2')
conflicts=('sparse')
provides=('sparse')
source=("$pkgname::git+git://git.kernel.org/pub/scm/devel/sparse/sparse.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make all
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/sparse/LICENSE
}
