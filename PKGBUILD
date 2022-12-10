# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python-irc3
_pkgname=irc3
pkgver=1.1.8
pkgrel=1
pkgdesc="plugable irc client library based on asyncio"
arch=(any)
url="https://github.com/gawel/irc3"
license=('MIT')
depends=('python' 'python-venusian' 'python-setuptools')
optdepends=('python-docopt: for the irc3 command')
source=("https://pypi.io/packages/source/i/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8057be86e89b79a2358d4fae9b9c404350af136bd0ce11e232e7f1bee7c3b04b')

prepare() {
    sed -i "s/setup_requires=\[\"pytest-runner\"\],//" "$srcdir/$_pkgname-$pkgver/setup.py"
}

build() {
    cd $_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $_pkgname-$pkgver
    python setup.py install --root=$pkgdir --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
