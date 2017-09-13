# Contributor: Daniel Wallace <daniel.wallace at gatech dot edu>
# Maintainer: Pablo Lezaeta <prflr88 (arroba) gmail (punto) com>

pkgname=ponysay-devel-git
_pkgname=ponysay
pkgver=3.0.1.git2243
pkgrel=1
pkgdesc="Pony reimplementation of cowsay. (develop branch)"
arch=("any")
url="https://github.com/erkin/ponysay"
license=("GPL3" "FDL")
depends=("python3" "coreutils")
provides=("ponysay")
conflict=("ponysay" "ponysay-git" "ponysay-free" "ponysay-dev-git")
makedepends=("git" "texinfo" "util-say-git")
branch=("develop")
source=("$_pkgname::git+https://github.com/erkin/ponysay#branch=$branch")
md5sums=("SKIP")

pkgver(){
	cd "$_pkgname"
	echo "$(git describe --abbrev=0 | sed 's/-/./g' ).git$(git rev-list --count HEAD | sed 's/-/./g' )"
}

package() {
	cd "$srcdir/$_pkgname"

	# For prevent missing ttyponies
	./dev/dist.sh ttyponies

	python3 ./setup.py --freedom=partial --prefix=/usr --dest-dir=$pkgdir --everything --with-pdf=/usr/share/doc/ponysay --without-pdf-compression install
}

# vim:set ts=2 sw=2 et:
