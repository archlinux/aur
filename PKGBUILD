# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=graphenex
pkgver=1.4.3
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
sha512sums=('fdbf831da0f268e07bf498a4ef98865fe96e79c156b9e64e633542f19d8beef18c388a843e422202e1b8ce08dac07a450b5941703e63605639c21d331549ec28')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
