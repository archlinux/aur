# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-fakeldap
pkgver=0.6.5
pkgrel=1
pkgdesc="LDAPObject implementation for mocking LDAP servers"
arch=('any')
url="https://github.com/zulip/fakeldap"
license=('BSD-3-Clause')
depends=('python-ldap')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-nose' 'python-coverage')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/fakeldap/fakeldap-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('6d57c8355ffa3664b4c362b2ab321065dbdad165188b89af880228967cd268c6'
            '53f2d4dbeedeccd2cba3179e9f38740aeee5490750de976412ee6a2ad6bd5374')

build() {
    cd "fakeldap-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "fakeldap-$pkgver"
    nosetests
}

package() {
    cd "fakeldap-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
