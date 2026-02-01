# Maintainer: Antoine Gaudreau Simard <antoineg.simard 'at' gmail.com>
pkgname=python-questo
pkgver=0.4.2
pkgrel=1
pkgdesc="A library of extensible and modular CLI prompt elements"
arch=('any')
url="https://github.com/petereon/questo"
license=('MIT')
depends=(
    'python'
    'python-yakh'
    'python-rich'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
source=(
    "https://files.pythonhosted.org/packages/a8/e6/4a86ccd5710c2fddae92786f15f2c69637b417905ff239d7424b55e342cb/questo-${pkgver}.tar.gz"
)
sha256sums=('bcc917c2f1a65872e2bd02e79e226a716fd2d68a1ebe0d23c1828aa116aa6da6')

build() {
    cd "questo-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "questo-${pkgver}"

    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
