# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=em-keyboard
pkgdesc='Command-line utility for referencing emoji characters by name'
pkgver=5.2.0
pkgrel=1
url=https://github.com/hugovk/em-keyboard
license=(MIT)
arch=(any)
depends=(python-docopt python-xerox python-wheel)
makedepends=(git python-build python-hatchling python-hatch-vcs python-installer python-wheel)
checkdepends=(python-tox)
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('fe75c4acdf8e22a1632ba9bf6f9bc2d6137c0c773b89498dcd9ee2fd7e40bcb28ce8b801a27585f06e849ae3e3519b06cc8dad40c4915e1b50980e06f5243f28')

build () {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check () {
	cd "$pkgname"
	tox
}

package () {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
