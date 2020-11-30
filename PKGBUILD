# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Duncan Bain <duncanjbain@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=Minecraft-Overviewer
pkgname=(${_pkgname,,} ${_pkgname,,}-docs)
pkgver=0.16.10
_gitcommit=074a7d23a105732ce814e9c17307c4931cf11cc1
pkgrel=1
pkgdesc="Render large resolution images of a Minecraft map with a web UI"
arch=('x86_64')
url="https://github.com/overviewer/${_pkgname}"
license=('GPL3')
depends=('python' 'python-pillow' 'python-numpy')
makedepends=('python-sphinx')
source=("$url/archive/$_gitcommit.tar.gz")
b2sums=('980f79ba9698e8d4a3363bbd3b92e22ca64060f5f2d22d12ca07903a0cfa4c61d9da1594a819d94e0e604deb386b62f6b456357166b0d2c1b7b4e52753529e18')

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
