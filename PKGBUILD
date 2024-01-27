# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=hpy
pkgver=0.9.0
pkgrel=1
pkgdesc='A better C API for Python'
arch=(any)
url='https://github.com/hpyproject/hpy'
license=('MIT')
depends=('python>=3.8' 'python-setuptools>=64.0')
makedepends=(python-build
             python-installer
             'python-setuptools-scm>=6.0'
             'python-wheel>=0.34.2')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('2809d0c257419bf1ceccf41082b45a430ea1785fc182e4733c9db42509bc4e81a8993d17be9f79f9fdb74ddcd5689547e43d475ac037d8ca4a5cfd4722a368f3')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
