# Maintainer: Gökçe Aydos <aur2022_aydos_de>

pkgname=jupyterlab-hatch-jupyter-builder-git
_realm=jupyterlab
_name_wogit=${pkgname%-git}
_name=${_name_wogit#$_realm-}
provides=($_name_wogit)
conflicts=($_name_wogit)
pkgver=v0.8.1.r6.g1da7d0f
pkgrel=1
pkgdesc="Build hook plugin for Hatch that adds a build step for use with Jupyter packages"
arch=(any)
url=https://github.com/$_realm/$_name
license=(BSD)
depends=(
	python
	python-hatchling
)
makedepends=(
	python-build
	python-installer
	python-wheel
	git
)
source=(git+https://github.com/$_realm/$_name)
md5sums=(SKIP)
pkgver() {
	cd $_name
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cd $_name
	python -m build --wheel --no-isolation
}
package() {
	cd $_name
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
