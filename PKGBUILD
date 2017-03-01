# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Duncan Bain <duncanjbain@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

# Use a snapshot build, matching http://overviewer.org/downloads until
# a proper release is made.  This snapshot suports Minecraft 1.11.2

_pkgname=Minecraft-Overviewer
pkgname=(${_pkgname,,} ${_pkgname,,}-docs)
pkgver=0.12.158
_gitcommit=2add96132cf6eed4b31c34e72fcad7c13f96ffd6
pkgrel=1
pkgdec="Render a Minecraft map with a Google Maps interface"
arch=('x86_64' 'i686')
url="https://github.com/overviewer/${_pkgname}"
license=('GPL')
depends=('python2' 'python2-pillow' 'python2-numpy')
makedepends=('python2-sphinx')
source=("$url/archive/$_gitcommit.tar.gz")
sha512sums=('0ce8f22bd1dbac3a37976c27dfe45c2f842499828c593b604e1ec4421ea8eb1d8f7bb602657f1962aec6c4cdb98ec0074757d90b45d19def6b25af372d237edd')

build() {
	cd "${_pkgname}-$_gitcommit"
	python2 setup.py build

	cd ./docs
	make SPHINXBUILD=sphinx-build2 html
}

package_minecraft-overviewer() {
	cd "${_pkgname}-$_gitcommit"
	python2 setup.py install --prefix=/usr --root="$pkgdir"
}

package_minecraft-overviewer-docs() {
	arch=('any')
	cd "${_pkgname}-$_gitcommit/docs/_build/html"

	install -d "$pkgdir/usr/share/doc/${pkgbase}/html"
	cp -r -t "$pkgdir/usr/share/doc/${pkgbase}/html" -- *
}
