# Maintainer: Nissar Chababy <contact at funilrys dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-box
pypiPkgName=python_box
pkgver=7.3.1
pkgrel=1
pkgdesc="Advanced Python dictionaries with dot notation access"
arch=('x86_64')
url="https://github.com/cdgriffith/Box"
license=('MIT')
depends=('python')
optdepends=(
	'python-msgpack'
	'python-ruamel-yaml: YAML support'
	'python-toml: TOML support'
	'python-yaml: YAML support')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/bb/35/911965b97acf8f7813caa49487eb4c14c5de527d47d9b9ef0a5b16016834/python_box-7.3.1.tar.gz")
sha256sums=('a0bd9dbb4ddd2842f8d0143b8aa0c87d0e82e39093dd4698a5cbbb2d2ac71361')

build() {
	cd "$pypiPkgName-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pypiPkgName-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/${pkgname/-/_}-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
