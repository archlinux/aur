# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=graphenex
pkgver=1.5.0
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
sha512sums=('12c5fc76ecf9c0a48a409cd9a4c4dc602bf17c91f0b6a22e86574af79d631b5232838a7bf045603e01352e2825636a61272bb7a806ccc5b4a14a8bdb92d45925')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
