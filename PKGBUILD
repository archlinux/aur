# Maintainer: Wojtmic <mail at wojtmic dot dev>

pkgname=axon-applauncher
_pkgpyname=axon_applauncher
pkgver=1.0.3.2
pkgrel=1

pkgdesc="Hyper-customizable app launcher made in Python"
arch=('any')

url="https://github.com/wojtmic/axon"
license=('GPL3')

depends=('python' 'python-pyqt6' 'python-simpleeval' 'python-json5')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')

source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/wojtmic/axon/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('278af560701402ec5360453b4d8d96f4a2c346d04c39b11263c93839ae18b7ef')

build() {
    cd "$srcdir/axon-$pkgver"
    python -m build --wheel --sdist --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/axon-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
