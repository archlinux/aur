# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=split-folders
pkgname=python-${_pkgname}
pkgver=0.6.0
pkgrel=1
pkgdesc='A Python library to split folders with files (i.e. images) into training, validation and test (dataset) folders.'
arch=(x86_64)
url='https://github.com/jfilter/split-folders'
license=(MIT)
depends=('python' 'python-tqdm')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('f310920f4809b6ea5ec31113572db8e169c45c58032c7cf46cbdf856a8545fe863f189ab23d98daf693471128b599e89b1883f7a09ba8295ee05326c19e881ee')

build() {
	cd "${_pkgname}-${pkgver}"
	## skip dependency check because of pinned deps
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
