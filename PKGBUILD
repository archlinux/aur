# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>

pkgname=python-faust
pkgver=1.10.4
pkgrel=1
pkgdesc="Python Stream Processing"
arch=('x86_64')
url='https://github.com/robinhood/faust'
license=('BSD')
depends=(
	'python-aiohttp'
	'python-aiohttp-cors'
	'python-robinhood-aiokafka' ## AUR
	'python-click'
	'python-colorclass'
	'python-mode' ## AUR
	'python-opentracing'
	'python-terminaltables'
	'python-venusian'
	'python-yarl'
	'python-croniter' ## AUR
	'python-mypy_extensions')
makedepends=('python-setuptools' 'cython')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/faust/faust-$pkgver.tar.gz")
sha256sums=('ffcd350ea29d528f6814fc9a42b5e50e130310da054a93e9d8216ef89a254611')

build() {
	cd "faust-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "faust-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
