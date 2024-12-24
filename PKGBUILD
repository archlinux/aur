# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=split-folders
pkgname=python-${_pkgname}
pkgver=0.5.1
pkgrel=2
pkgdesc='A Python library to split folders with files (i.e. images) into training, validation and test (dataset) folders.'
arch=(x86_64)
url='https://github.com/jfilter/split-folders'
license=(MIT)
depends=('python' 'python-tqdm')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('3126144fb80701028266a80ad9a27eda0939a257527186643bd6bcd582fd1dc47f35ab4fba35ba82b0688ea51c41b608f04040685a1c13af913497942957420f')

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
