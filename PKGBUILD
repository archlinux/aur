# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname="python-upnpclient"
pkgver=2.0.3
pkgrel=1
pkgdesc="Python 3 library for accessing uPnP devices."
arch=("any")
url="https://github.com/flyte/upnpclient"
license=("MIT")
depends=('python-requests' 'python-dateutil' 'python-lxml' 'python-ifaddr')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('78db288497e01b8d164f44100f87aad66ca319efe22716501f3706f7c6f17cdc')

build() {
    cd "upnpclient-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "upnpclient-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -x
}

package() {
    cd "upnpclient-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
