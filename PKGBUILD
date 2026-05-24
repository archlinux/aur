# Maintainer: Antoine Gaudreau Simard <antoineg.simard 'at' gmail.com>
pkgname=python-beaupy
pkgver=3.12.0
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
    "https://files.pythonhosted.org/packages/80/65/6e501a432db02adb3c974473d73360880878797fbe25405c08024fa76bce/beaupy-${pkgver}.tar.gz"
)
sha256sums=('e0ca6d2356b611ae734c8cf97b28ed9e3bb941d3207af2426e182da836a385d6')

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
