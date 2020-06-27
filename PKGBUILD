pkgname=src-git
_pkgname=src
pkgver=1.28.r2.g55adcbd
pkgrel=1

pkgdesc="Simple Revision Control with modern UI for single-file projects"
url="http://www.catb.org/esr/src/"
arch=('any')
license=('BSD')

depends=('python3' 'rcs')
optdepends=('rcs-fast-import: required for src fast-import')
makedepends=('asciidoc' 'git')

source=('git+https://gitlab.com/esr/src.git')

sha1sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/; s/-/./g'
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" prefix=/usr install
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
