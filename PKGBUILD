# Maintainer: Derin Yarsuvat <derin.aur at fea dot st>
pkgname=python-yams
pkgver=0.67
pkgrel=1
pkgdesc="A Last.FM scrobbler for MPD"
arch=('x86_64')
url="https://github.com/Berulacks/yams"
license=('GPL3')
depends=('python' 'mpd' 'python-pyaml' 'python-mpd2' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/Berulacks/yams/archive/$pkgver.tar.gz")
sha256sums=("fb8145708e35560d0cd868318466433770ba302a3bf84b907ec0206f54869e47")

build() {
	cd "$srcdir/yams-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/yams-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D "$srcdir/yams-$pkgver/yams.service" "$pkgdir/usr/lib/systemd/user/yams.service"
}
