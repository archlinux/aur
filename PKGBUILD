# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Duncan Bain <duncanjbain@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=Minecraft-Overviewer
pkgname=(${_pkgname,,} ${_pkgname,,}-docs)
pkgver=0.13.84
_gitcommit=0004540a57677486c46da02eed66f70e3412b7a5
pkgrel=1
pkgdec="Render a Minecraft map with a Google Maps interface"
arch=('x86_64')
url="https://github.com/overviewer/${_pkgname}"
license=('GPL')
depends=('python2' 'python2-pillow' 'python2-numpy')
makedepends=('python2-sphinx')
source=("$url/archive/$_gitcommit.tar.gz")
sha512sums=('ecad045886ad8becb6a0b80eba6af9f2f4b9dabac9ac013e219335b4e849cd3ead41fb39a4a30bbd1236f5fb664e6130047019a748eb4f3cba4067b3d179ee97')

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
