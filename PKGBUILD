# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vaping
pkgver=1.4.3
pkgrel=1
pkgdesc='python-smokeping alternative'
arch=('any')
url="https://github.com/20c/vaping"
license=('Apache')
depends=(
	'python-pid'
	'python-daemon'
	'python-whichcraft'
	'python-munge'
	'python-confu'
	'python-pluginmgr')
makedepends=('python-poetry' 'python-build' 'python-install')
# checkdepends=('python-pytest' 'python-pytest-filedata' 'python-yaml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d23eddcdbb7b2cd63219dd689fb89bcfb2039a3bbf57e9ee74bcc2db0003e35c')

build() {
	cd "vaping-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

## requires too many dependencies outside of AUR
# check() {
# 	cd "vaping-$pkgver"
# 	PYTHONPATH=./src pytest -x
# }

package() {
	export PYTHONHASHSEED=0
	cd "vaping-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
}
