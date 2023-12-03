# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=graphenex
pkgver=1.5.1
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
sha512sums=('a554e80e555948f6d97a4f03c87b6ea5b9999004d9625ad0a2110fec48cc9f5fbfed85e7004c5b17c4f88357ea0c6540d4b5ddb3756d7155cc7e8d8d68b1339d')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
