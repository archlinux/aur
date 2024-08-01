# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Anthony25 <Anthony Ruhier>

pkgname=python-ncclient
pkgver=0.6.15
pkgrel=1
pkgdesc="Python library for NETCONF clients"
arch=("any")
url="https://github.com/ncclient/ncclient"
license=("Apache-2.0")
depends=('python'
         'python-paramiko'
         'python-lxml'
         'python-six')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-pytest-runner'
              'python-pytest-cov'
              'python-sphinx'
              'flake8')
changelog='Changelog'
source=("$pkgname-$pkgver.tar.gz::https://api.github.com/repos/${pkgname#python-}/${pkgname#python-}/tarball/refs/tags/v$pkgver")
b2sums=('1c8a0428eceb5896aaf1304c92b67c5f2849dfc28ede232ea3496f2c8942102a4a907f23797c538e2ee1195baa2d21586d8b21688241ece60409a08e137f48d4')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    python -m pytest
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/README.md"
    install -Dm644 README.rst "$pkgdir/usr/share/licenses/$pkgname/README.rst"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
