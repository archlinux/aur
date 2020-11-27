# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

pkgname=("lynx-ldk")
_pkgname="ldk"
pkgver=3.5.6
pkgrel=2
pkgdesc="Build hybrid web/desktop applications or wrappers on Linux, with Python, JavaScript, HTML5, and CSS3 and QTWebengine"
url="https://gitlab.com/LynxOS/$_pkgname"
depends=("python>=3.8" "desktop-file-utils" "python-pyqt5>=5.14" "python-pyqtwebengine" "pyside2>=5.14" "qt5-webengine")
makedepends=("python-setuptools")
license=("GPL")
arch=("any")
source=("$url/-/archive/$pkgver/ldk-$pkgver.tar.gz"
        "ldk.conf")

build() {
    cd ldk-$pkgver
        sed -i "s/PySide2//" setup.py
        sed -i "s/PyQt5//" setup.py
	python setup.py build
}

package() {
    install -Dm644 "$srcdir/ldk.conf" "$pkgdir/etc/ldk.conf"
    cd ldk-$pkgver
	  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
