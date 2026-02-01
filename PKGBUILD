# Maintainer: Antoine Gaudreau Simard <antoineg.simard 'at' gmail.com>
pkgname=python-beaupy
pkgver=3.11.0
pkgrel=1
pkgdesc="A library of elements for interactive TUIs in Python"
arch=('any')
url="https://github.com/petereon/beaupy"
license=('MIT')
depends=(
    'python'
    'python-emoji'
    'python-yakh'
    'python-questo'
    'python-rich'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
source=(
    "https://files.pythonhosted.org/packages/78/b2/1478a56b9669eda5fc6f9fed9e9aa47fbe73b564c5fb5cd55d719cf5b32e/beaupy-${pkgver}.tar.gz"
)
sha256sums=('c264d13061c5741ceef5462b3752e572a0a7c3b8bd8dac870d10aec8a7d6b2ee')

build() {
    cd "beaupy-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "beaupy-${pkgver}"

    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
