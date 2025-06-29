# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Junker


pkgname=python-jdatetime
_name=jdatetime
pkgver=5.2.0
pkgrel=2
pkgdesc='Jalali calendar binding for Python based on Python`s datetime module'
arch=('any')
url=https://github.com/slashmili/python-jalali
license=('Python')
depends=('python' 'python-jalali-core')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c81d5898717b82b609a3ce2a73f8b8d3230b0c757e5c0de9d6b1acfdc224f551')

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
