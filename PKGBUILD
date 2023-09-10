# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=graphenex
pkgver=1.4.0
pkgrel=1
pkgdesc="Automated System Hardening Framework"
arch=('x86_64')
url="https://github.com/grapheneX/grapheneX"
depends=('python-flask-socketio' 'python-coloredlogs'
         'python-terminaltables' 'python-pyinquirer' 'python-psutil'
         'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('b60bae3228948d7beea862df62bd195b0eb3dd0d7517cbe69737d61aac39c42d44dab3477dca5d5e0cc8d95305044e13a1c712c153c5c5d030ccd3b0231f36a9')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
