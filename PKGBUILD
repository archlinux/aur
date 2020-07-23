# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Duncan Bain <duncanjbain@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=Minecraft-Overviewer
pkgname=(${_pkgname,,} ${_pkgname,,}-docs)
pkgver=0.15.86
_gitcommit=3282791bc44342a4964fb531e85b2166e9caf9e6
pkgrel=1
pkgdesc="Render large resolution images of a Minecraft map with a web UI"
arch=('x86_64')
url="https://github.com/overviewer/${_pkgname}"
license=('GPL3')
depends=('python' 'python-pillow' 'python-numpy')
makedepends=('python-sphinx')
source=("$url/archive/$_gitcommit.tar.gz")
b2sums=('fe8ab1aeaf75af2785b529309d564eb0a24470b8dc22ce8e7685f932691249f5bba6713a964e351ceb36395900321cf6e7435995cb69e920dfa58e57fade34d3')

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
