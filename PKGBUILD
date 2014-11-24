pkgname=src-git
pkgver=0.12.r2.g80ab9e0
pkgrel=1

pkgdesc="Simple Revision Control with modern UI for single-file projects"
url="http://www.catb.org/esr/src/"
arch=('any')
license=('BSD')

depends=('python2' 'rcs')
optdepends=('rcs-fast-import: required for src fast-import')
makedepends=('asciidoc')

source=('git+https://gitorious.org/src-vcs/src-vcs.git')

sha1sums=('SKIP')

pkgver() {
	cd src-vcs
	git describe --long | sed -r 's/([^-]*-g)/r\1/; s/-/./g'
}

package() {
	cd src-vcs
	make DESTDIR="$pkgdir" prefix=/usr install
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
