# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-browser-cookie3
pkgver=0.11.0
pkgrel=1
pkgdesc="Loads cookies used by your web browser into a cookiejar object"
url="https://github.com/borisbabic/browser_cookie3"
depends=('python' 'python-keyring' 'python-pbkdf2' 'python-pyaes' 'python-crypto' 'python-lz4')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("browser_cookie3-$pkgver.tar.gz::https://github.com/borisbabic/browser_cookie3/archive/$pkgver.tar.gz"
        "1.patch")
sha256sums=('3a44bc935772a8442c04392a39ae6a405f152e84042110287ccf171f2f319f42'
            '3b6a1bb4c40fd735346b76b08f0df857cbe05f630ce23df7c05076d37f069a76')

prepare() {
    cd $srcdir/browser_cookie3-$pkgver
    patch -p1 < ../1.patch
}

build() {
    cd $srcdir/browser_cookie3-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/browser_cookie3-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
