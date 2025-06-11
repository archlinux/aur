# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.1.15
pkgrel=4
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-pillow' 'python-qrcode')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('07710878d7411c72ff51e3b0473bd8e8e0f0172e7d40ab6f70a772317c5da740')

build() {
	cd "$srcdir/a2ln-server-$pkgver/"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 "a2ln.service" "$pkgdir/usr/lib/systemd/user/a2ln.service"
}
