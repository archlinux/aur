# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vaping
pkgver=1.5.4
pkgrel=1
pkgdesc='A healthy alternative to SmokePing!'
arch=('any')
url="https://github.com/20c/vaping"
license=('Apache')
depends=(
	'python-pid'
	'python-daemon'
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
makedepends=('python-poetry-core' 'python-build' 'python-installer')
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
sha256sums=('2bbdaf9a0608e1eb0e8044ba4aa366384734b2ab3a066880429e0f0389e7cbd7')

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
