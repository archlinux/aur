# Maintainer: wisp3rwind <17089248+wisp3rwind@users.noreply.github.com>

pkgname=beets-alternatives
pkgver=0.13.1
pkgrel=2
pkgdesc="Beets plugin to manage external files"
arch=('any')
url="https://github.com/geigerzaehler/${pkgname}"
license=('MIT')
depends=('python' 'beets>=1.6.0')
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('7100bdee256f6036486ff29c6d82cbf496a096714d07390bce490a5c45aceb1df341e8f8a3fcc40bc89c9a985f59c0784961ced76400b150c7c19b08fc0bcfb6')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    rm 'beetsplug/__init__.py'
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

# vim: set et sw=4 ts=4 :
