# Maintainer: Derin Yarsuvat <derin.aur at fea dot st>
pkgname=python-yams
pkgver=0.7.1
pkgrel=1
pkgdesc="A Last.FM scrobbler for MPD"
arch=('x86_64')
url="https://github.com/Berulacks/yams"
license=('GPL3')
depends=('python' 'mpd' 'python-pyaml' 'python-mpd2' 'python-requests' 'python-psutil')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/Berulacks/yams/archive/$pkgver.tar.gz")
sha256sums=('dd90e65d661454f2d553e123025b673c2042790e4d28690e5938e614613baef8')

build() {
	cd "$srcdir/yams-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/yams-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D "$srcdir/yams-$pkgver/yams.service" "$pkgdir/usr/lib/systemd/user/yams.service"
}
