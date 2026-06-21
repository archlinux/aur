# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.1.17
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-pillow' 'python-qrcode')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b3dff28ce9636da4e3984e9ebe6f6589f84e08eba7f0ee4c4605395bd6db5e38')

build() {
	cd "$srcdir/a2ln-server-$pkgver/"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 "a2ln.service" "$pkgdir/usr/lib/systemd/user/a2ln.service"
}
