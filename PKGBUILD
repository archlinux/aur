# Maintainer: Derin Yarsuvat <derin.aur at fea dot st>
pkgname=python-yams
pkgver=0.7.3
pkgrel=1
pkgdesc="A Last.FM scrobbler for MPD"
arch=('x86_64')
url="https://github.com/Berulacks/yams"
license=('GPL3')
depends=('python' 'mpd' 'python-pyaml' 'python-mpd2' 'python-requests' 'python-psutil')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/Berulacks/yams/archive/$pkgver.tar.gz")
sha256sums=('a664f514208c5ec107b7bbc8dda0b6b6d168a9da335703e6fd645da3f333f1a1')

build() {
	cd "$srcdir/yams-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/yams-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D "$srcdir/yams-$pkgver/yams.service" "$pkgdir/usr/lib/systemd/user/yams.service"
}
