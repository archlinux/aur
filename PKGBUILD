# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.1.15
pkgrel=5
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-pillow' 'python-qrcode')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fb61258f08becc4b28a64b90302015975c836805eb3c5d4f4ef4e2b0086bc780')

build() {
	cd "$srcdir/a2ln-server-$pkgver/"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 "a2ln.service" "$pkgdir/usr/lib/systemd/user/a2ln.service"
}
