# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Duncan Bain <duncanjbain@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

# Use a snapshot build, matching http://overviewer.org/downloads until
# a proper release is made.  This snapshot suports Minecraft 1.9

_pkgname=Minecraft-Overviewer
pkgname=(${_pkgname,,} ${_pkgname,,}-docs)
pkgver=0.12.130
_gitcommit=1a41d8d195a1ab5645f85b70c2942e97926009e6
pkgrel=1
pkgdec="Render a Minecraft map with a Google Maps interface"
arch=('x86_64' 'i686')
url="https://github.com/overviewer/${_pkgname}"
license=('GPL')
depends=('python2' 'python2-pillow' 'python2-numpy')
makedepends=('python2-sphinx')
source=("$url/archive/$_gitcommit.tar.gz")
sha256sums=('b7d2e35554cd89de26562574f4dac14f34c4d0d0b3a6a709c9700c3928e07a52')

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
