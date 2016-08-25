# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Duncan Bain <duncanjbain@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

# Use a snapshot build, matching http://overviewer.org/downloads until
# a proper release is made.  This snapshot suports Minecraft 1.10

_pkgname=Minecraft-Overviewer
pkgname=(${_pkgname,,} ${_pkgname,,}-docs)
pkgver=0.12.137
_gitcommit=7a0930af6379131c36cd9a6c0a07ab835cdc18c2
pkgrel=1
pkgdec="Render a Minecraft map with a Google Maps interface"
arch=('x86_64' 'i686')
url="https://github.com/overviewer/${_pkgname}"
license=('GPL')
depends=('python2' 'python2-pillow' 'python2-numpy')
makedepends=('python2-sphinx')
source=("$url/archive/$_gitcommit.tar.gz")
sha256sums=('314e8e25a8490ff8e55ca3280a1f045357f470a0faa6a6eddf433a5aba74d3bc')

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
