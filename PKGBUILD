# Maintainer: CYBERDEViL <cyberdevilnl at protonmail dot com>
pkgname=searx-qt
_pkgver=0.1-beta1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Lightweight desktop application for Searx"
arch=('any')
url="https://notabug.org/CYBERDEViL/searx-qt"
license=('GPL3')
depends=('python-requests' 'python-pyqt5')
optdepends=('python-pysocks: socks proxy support')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('9360665f8640f7e0b29318c7503305cf8df21f533ecdd804f312d26e9c47e534')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm755 "bin/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "share/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
