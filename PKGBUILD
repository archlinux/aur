pkgname=src-git
pkgver=0.12.r0.g1cb9e4d
pkgrel=1

pkgdesc="Simple Revision Control with modern UI for single-file projects"
url="http://www.catb.org/esr/src/"
arch=('any')
license=('BSD')

depends=('python2' 'rcs')
makedepends=('asciidoc')
optdepends=('rcs-fast-import: required for src fast-import')

source=('git+https://gitorious.org/src-vcs/src-vcs.git'
        '0001-Makefile-run-src-version-from-current-directory.patch')

sha1sums=('SKIP'
          '633120c7c72c778113664636075699b1999ed30a')

pkgver() {
	cd src-vcs
	git describe --long | sed -r 's/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
	cd src-vcs
	git am "$srcdir"/0001-Makefile-run-src-version-from-current-directory.patch
}

package() {
	cd src-vcs
	make DESTDIR="$pkgdir" prefix=/usr install
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
