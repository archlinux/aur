# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=graphenex
_pkgname=GrapheneX
pkgver=1.3.1
pkgrel=2
pkgdesc="Automated System Hardening Framework"
url="https://github.com/grapheneX/grapheneX"
depends=('python' 'python-flask-socketio' 'python-coloredlogs'
         'python-terminaltables' 'python-pyinquirer' 'python-psutil'
         'python-colorama')
makedepends=('python-setuptools' 'python-dephell')
license=('GPL3')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/source/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('fd9d49d609083bc518d7412a1f5aa62f')

prepare() {
    cd "$_pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
