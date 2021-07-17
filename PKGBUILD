# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Duncan Bain <duncanjbain@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=Minecraft-Overviewer
pkgname=(${_pkgname,,} ${_pkgname,,}-docs)
pkgver=0.17.34
_gitcommit=86b241a5f7aa687a6af34289eee75d226f07d049
pkgrel=1
pkgdesc="Render large resolution images of a Minecraft map with a web UI"
arch=('x86_64')
url="https://github.com/overviewer/${_pkgname}"
license=('GPL3')
depends=('python' 'python-pillow' 'python-numpy')
makedepends=('python-sphinx')
source=("$url/archive/$_gitcommit.tar.gz")
b2sums=('f297f1d3f1c93c325a7499156b2c7543c8c8fcac869c71fd33f30e7b68d649c2c8f9e3307acba440dce249710a7f9c23419cda3cf4b762949bfa45c322b40a23')

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
