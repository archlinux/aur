# Maintainer: Nissar Chababy <contact at funilrys dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-box
pypiPkgName=python_box
pkgver=7.3.2
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
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/29/f7/635eed8c500adf26208e86e985bbffb6ff039cd8950e3a4749ceca904218/python_box-7.3.2.tar.gz")
sha256sums=('028b9917129e67f311932d93347b8a4f1b500d7a5a2870ee3c035f4e7b19403b')

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
