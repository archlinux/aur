# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=guiscrcpy
pkgver=1.11.3
pkgrel=1
pkgdesc="A full fledged GUI integration for the most award winning open-source Android screen mirroring system -- scrcpy"
arch=('i686' 'x86_64')
url="https://srevinsaju.github.io/guiscrcpy"
license=('GPL3')
depends=('scrcpy' 'python-pyqt5' 'python-psutil' 'python-qdarkstyle' 'python-gitpython')
makedepends=('python-setuptools')
optdepends=('python-pystray: for developers'
            'usbaudio: AOA audio, deprecated since Android 8.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/srevinsaju/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('8693577432579a00858fd5233d3dc4c94b2fee7fe26b3368ea101845e1720514'
            'a97ede5e1f363df0b3960c7cfbfdff69e8c2b2c39ef0abc522d5ff5ecb04061b'
            '7d85c9d18ee989efa9cec44924294a5775c00a0d1ca6c369fb43a216e1d6f19f')
            
build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "installers/linux/icons/${pkgname}_logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
