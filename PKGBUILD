# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: yochanamarqos
pkgname=python-torrentstream
_name=${pkgname#python-}
pkgver=0.2.2
pkgrel=1
pkgdesc="Python simple BitTorrent streaming library based on libtorrent"
arch=('any')
url="https://github.com/XayOn/torrentstream"
license=('none')
depends=('python' 'python-async-timeout' 'python-rich' 'libtorrent')
makedepends=('python-setuptools' 'python-dephell')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('374bfd2c3dcf5051d0464aeac13564cb17776f25bb7708d91167d4df74cc83da')

prepare() {
	cd "$_name-$pkgver"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
