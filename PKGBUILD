# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Duncan Bain <duncanjbain@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=Minecraft-Overviewer
pkgname=(${_pkgname,,} ${_pkgname,,}-docs)
pkgver=0.12.215
_gitcommit=139e22f2f888b289aa296b9028612544adc037b5
pkgrel=1
pkgdec="Render a Minecraft map with a Google Maps interface"
arch=('x86_64')
url="https://github.com/overviewer/${_pkgname}"
license=('GPL')
depends=('python2' 'python2-pillow' 'python2-numpy')
makedepends=('python2-sphinx')
source=("$url/archive/$_gitcommit.tar.gz")
sha512sums=('57ff85966e7c24a1d34ac168e9997e8ff27fc8a456bc0e7f81b977f32740f679aeafb5c9715f59f6e0aca0ae105cc2ee5d615d2b95fb025efc3bf9d30feeefe7')

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
