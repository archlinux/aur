# Maintainer: Narthorn <narthorn@gmail.com>

_pkgname=termdown
pkgname=$_pkgname-git
pkgver=2.0.0.r0.g2ebf6fc
pkgrel=1
arch=('any')
pkgdesc='Countdown timer and stopwatch in your terminal'
url='https://github.com/trehn/termdown'
license=('GPL3')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
depends=('python' 'python-pillow' 'python-art' 'python-dateutil')
optdepends=('espeak: voice support for spoken countdowns')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_pkgname
    git clean -dfx
}

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

package() {
	cd $_pkgname
	python -m installer --destdir="$pkgdir" dist/*.whl
}
