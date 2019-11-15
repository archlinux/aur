# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Duncan Bain <duncanjbain@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=Minecraft-Overviewer
pkgname=(${_pkgname,,} ${_pkgname,,}-docs)
pkgver=0.14.87
_gitcommit=7d9feb3cfc5c378ffa652882a33d3de227ff5e1a
pkgrel=1
pkgdesc="Render large resolution images of a Minecraft map with a web UI"
arch=('x86_64')
url="https://github.com/overviewer/${_pkgname}"
license=('GPL3')
depends=('python' 'python-pillow' 'python-numpy')
makedepends=('python-sphinx')
source=("$url/archive/$_gitcommit.tar.gz")
sha512sums=('0b0187b0a433170efb8dc3413f28fa419e0eb561d684e68fdbac771c9960f1bfb0819bf5cd5d28430dc6eecc9ef7fff2186c4ad411aa246e18a2bd978e8bdad1')

build() {
	cd "${_pkgname}-$_gitcommit"
	python setup.py build

	cd ./docs
	make html
}

package_minecraft-overviewer() {
	cd "${_pkgname}-$_gitcommit"
	python setup.py install --prefix=/usr --root="$pkgdir"
}

package_minecraft-overviewer-docs() {
	arch=('any')
	depends=()
	cd "${_pkgname}-$_gitcommit/docs/_build/html"

	install -d "$pkgdir/usr/share/doc/${pkgbase}/html"
	cp -r -t "$pkgdir/usr/share/doc/${pkgbase}/html" -- *
}
