# Maintainer: shtrophic <aur at shtrophic dot net>

_pkgname=shgo
pkgname="python-$_pkgname-git"
pkgdesc="Simplicial Homology Global Optimization"
pkgver=0.4.3.r70.g47936c6
pkgrel=1
arch=(any)
license=(MIT)
url="https://github.com/Stefan-Endres/$_pkgname"
makedepends=('git' 'python-build' 'python-installer')
depends=('python-numpy' 'python-scipy')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")

source=("$_pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	python -m build --wheel --no-isolation
}

package() {
	cd $_pkgname
	python -m installer --destdir="$pkgdir" dist/*.whl
}

