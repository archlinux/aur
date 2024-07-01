# Maintainer: pvdp <pvdp at email dot com>
# Contributor: hcra <hcra at u53r dot space>
# Contributor: Pico Paco Nano <founderofjp@gmail.com>
# Contributor: felix.s <felix.von.s@posteo.de>

pkgname=qweborf
_pkgname=weborf
pkgver=1.2
pkgrel=1
pkgdesc="Share files using the HTTP protocol. Allows using webdac. Provides Qt frontend."
arch=(any)
url="https://codeberg.org/ltworf/weborf"
license=(GPL3)
depends=('python' 'weborf' 'desktop-file-utils')
makedepends=('python-pyqt5' 'python-setuptools')
conflicts=("$pkgname-git")
source=(https://codeberg.org/ltworf/weborf/releases/download/$pkgver/weborf_$pkgver.orig.tar.gz)
sha256sums=('eff00f5e0846f13a540a014b6e97ed4e6abcfd4e255a3f3dc7151832c7c50902')

build() {
    cd "$srcdir/$_pkgname-$pkgver/qweborf"

    pyuic5 qweborf/main.ui > qweborf/main.py
    gzip man/qweborf.1
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/qweborf"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 0644 man/qweborf.1.gz "$pkgdir/usr/share/man/man1/qweborf.1.gz"
    install -Dm 0755 qweborf/qweborf "$pkgdir/usr/bin/qweborf"
    install -Dm 0755 integration/qweborf.desktop "$pkgdir/usr/share/applications/qweborf.desktop"
}
