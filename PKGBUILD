# Maintainer: Derin Yarsuvat <derin.aur at fea dot st>
pkgname=python-yams
pkgver=0.7.2
pkgrel=1
pkgdesc="A Last.FM scrobbler for MPD"
arch=('x86_64')
url="https://github.com/Berulacks/yams"
license=('GPL3')
depends=('python' 'mpd' 'python-pyaml' 'python-mpd2' 'python-requests' 'python-psutil')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/Berulacks/yams/archive/$pkgver.tar.gz")
sha256sums=('f3b948f41079cc7622ce34ebfb017e3bf6b9a1c9572ba33996d0fba3cd6b33c9')

build() {
	cd "$srcdir/yams-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/yams-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D "$srcdir/yams-$pkgver/yams.service" "$pkgdir/usr/lib/systemd/user/yams.service"
}
