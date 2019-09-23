# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=guiscrcpy
pkgver=1.11
pkgrel=5
pkgdesc="A full fledged GUI integration for the most award winning open-source Android screen mirroring system -- scrcpy"
arch=('i686' 'x86_64')
url="https://srevinsaju.github.io/guiscrcpy"
license=('GPL3')
depends=('scrcpy' 'python-pyqt5' 'python-psutil' 'python-qdarkstyle')
makedepends=('python-setuptools')
optdepends=('python-pystray: for developers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/srevinsaju/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('29dbf3ced5a7c661aae0e559c66330e3b0c4abcb5c74937e8f1981c60ce6aacc'
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
