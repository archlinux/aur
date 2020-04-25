pkgname=("python-pymodbustcp" "python2-pymodbustcp")
pkgbase=python-pymodbustcp
pkgver=0.1.8
pkgrel=1
pkgdesc='A simple Modbus/TCP library for Python'
arch=('any')
url='https://github.com/sourceperl/pyModbusTCP'
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sourceperl/pyModbusTCP/archive/v${pkgver}.tar.gz")
md5sums=('46ab9813475e6509c111a450dfe815a0')

build() {
    cd "$srcdir/pyModbusTCP-$pkgver"
    python setup.py build
}

package_python-pymodbustcp() {
    depends=('python')
    cd "$srcdir/pyModbusTCP-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pymodbustcp() {
    depends=('python2')
    cd "$srcdir/pyModbusTCP-$pkgver"
    find . -name "*.py" -exec sed -i 's#/usr/bin/env python#/usr/bin/env python2#' {} \;
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
