# Maintainer: Nissar Chababy <contact at funilrys dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-box
pypiPkgName=python_box
pkgver=7.3.0
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
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/79/8d/ed12ca8b90b2fce966fdaad7de40f0980f1e9dababb9c963738326687c6a/python_box-7.3.0.tar.gz")
sha256sums=('39a85ba457d07122226ca60597882d763549713ab56ac7d55da41c4ad0e89a05')

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
