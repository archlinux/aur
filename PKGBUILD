pkgname=python-duckduckgo-search
_name=duckduckgo_search
pkgver=7.3.2
pkgrel=1
pkgdesc='Search for words, documents, images, news, maps and text translation using the DuckDuckGo.com search engine.'
arch=('any')
url=https://github.com/deedy5/duckduckgo_search
license=('MIT')
depends=('python-click' 'python-primp' 'python-lxml')
makedepends=('python-build' 'python-installer' 'python-wheel' )
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bfaffad8da476deeaf10e1016691eaa724debea80b6198d63c877f2f236f8018')

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
