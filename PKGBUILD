# Maintainer: Qoqnus master <mahisokhary@gmail.com>

pkgname=python-duckduckgo-search
_name=ddgs
pkgver=9.10.0
pkgrel=2
pkgdesc='Search for words, documents, images, news, maps and text translation using the DuckDuckGo.com search engine.'
arch=('any')
url=https://github.com/deedy5/duckduckgo_search
license=('MIT')
depends=(
	'python-click'
	'python-primp'
	'python-lxml'
	'python-h2'
	'python-fake-useragent'
	'python-httpcore'
	'python-httpx'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('d9381ff75bdf1ad6691d3d1dc2be12be190d1d32ecd24f1002c492143c52c34f')
provides=('ddgs')

build() {
	cd $_name-$pkgver
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd $_name-$pkgver
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Symlink license file
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	install -d "$pkgdir"/usr/share/licenses/$pkgname
	ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
	   "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
