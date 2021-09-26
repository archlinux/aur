# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-munge
pkgver=1.2.1.1
pkgrel=1
pkgdesc='Data manipulation client/library'
arch=('any')
url='https://github.com/20c/munge'
license=('Apache')
depends=('python-requests>=2.6' 'python-click>=5.1')
optdepends=('python-toml' 'python-tomlkit' 'python-yaml')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=('python-pytest-runner')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3ac675a807a624f59dfe9c27bb8ad41b52d7328a9b3828ae656c524c8cf34c15')

prepare() {
	cd "munge-$pkgver"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "munge-$pkgver"
	python setup.py build
}

check() {
	cd "munge-$pkgver"
	python setup.py pytest
}

package() {
	cd "munge-${pkgver}"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 docs/api.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
