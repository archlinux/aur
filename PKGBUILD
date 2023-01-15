pkgname=python-urlextract
_name=urlextract
pkgver=1.8.0
pkgrel=1
pkgdesc='Collects and extracts URLs from given text.'
arch=('any')
url=https://github.com/lipoja/URLExtract
license=('MIT')
depends=('python-idna' 'python-uritools' 'python-platformdirs' 'python-dnspython')
makedepends=('python-build' 'python-installer' 'python-wheel' )
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3573f6b812814efe06ca46e91e82d984edaa3cd07daaaaa296a467ad9881a037')

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
	ln -s "$site_packages"/$pkgname-$pkgver.dist-info/licenses/LICENSE \
	   "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
