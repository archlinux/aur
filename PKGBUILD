# Maintainer: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Junker


pkgname=python-jdatetime
_name=jdatetime
pkgver=4.1.1
pkgrel=1
pkgdesc='Jalali calendar binding for Python based on Python`s datetime module'
arch=('any')
url=https://github.com/slashmili/python-jalali
license=('Python')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1dd0ee210160c7bd30002803c443e6260ac602ea65b065652a1d567d3bfdca7a')

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
