# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Duncan Bain <duncanjbain@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=Minecraft-Overviewer
pkgname=(${_pkgname,,} ${_pkgname,,}-docs)
pkgver=0.15.0
_gitcommit=bdca0b92509f542ed69f051554f7db91f20bddd9
pkgrel=1
pkgdesc="Render large resolution images of a Minecraft map with a web UI"
arch=('x86_64')
url="https://github.com/overviewer/${_pkgname}"
license=('GPL3')
depends=('python' 'python-pillow' 'python-numpy')
makedepends=('python-sphinx')
source=("$url/archive/$_gitcommit.tar.gz")
sha512sums=('560cf910f5942c699f4db6e3dc0c9584291ba97b126b15acb74e0653e99140b80ee854600f5d960dffb67b7856ba304d98f47e20984239f7dad8fd1b31428bd8')

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
