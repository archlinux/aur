# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>

pkgname=python-adb-enhanced
pkgver=2.5.14
pkgrel=1
pkgdesc="Swiss-army knife for Android testing and development"
arch=("any")
url="https://github.com/ashishb/adb-enhanced"
license=("Apache")
depends=('android-tools' 'java-runtime' 'python-psutil' 'python-docopt')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0ce379b02be2023a29512f5cd923c6eeeb537858830b5e62c3f5c7e99f232954')

build() {
	cd "adb-enhanced-$pkgver"
	python -m build --wheel --no-isolation
}

## tests require an android device; do not add check

package() {
	export PYTHONHASHSEED=0
	cd "adb-enhanced-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
