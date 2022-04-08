# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vaping
pkgver=1.5.0
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
	'python-tomlkit' ## for python-munge
	'python-yaml' ## for python-munge
	'python-confu'
	'python-pluginmgr')
optdepends=(
	'python-graphsrv: standalone support'
	'python-graphyte: graphyte plugin'
	'python-prometheus_client: prometheus plugin'
	'python-pyzmq: zeromq plugin'
	'python-requests: graphite plugin'
	'python-whisper: whisper plugin'
	'python-vodka: standalone support'
	'rrdtool: rrdtool plugin')
makedepends=('python-poetry' 'python-build' 'python-installer')
checkdepends=(
	'fping'
	'python-pytest'
	'python-pytest-filedata'
	'python-graphsrv'
	'python-graphyte'
	'python-prometheus_client'
	'python-pyzmq'
	'python-requests'
	'python-whisper'
	'python-vodka'
	'rrdtool'
	'traceroute')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9ce6b6a25dd4733f5c781b0f4cd43d36b34d0365fc0f06666f208c8fcc4843f4')

build() {
	cd "vaping-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "vaping-$pkgver"
	PYTHONPATH=./src pytest -x --disable-warnings
}

package() {
	cd "vaping-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
