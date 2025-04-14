# Maintainer: Wojtmic <mail at wojtmic dot dev>

pkgname=axon-applauncher
_pkgpyname=axon_applauncher
pkgver=1.0.1
pkgrel=1

pkgdesc="Hyper-customizable app launcher made in Python"
arch=('any')

url="https://github.com/wojtmic/axon"
license=('GPL3')

depends=('python' 'python-pyqt6' 'python-simpleeval' 'python-json5')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')

source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/wojtmic/axon/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('d8bc2537587dba27afac59d16d7b6feaee4da228a004d11bab3c198d934a8226')

build() {
    cd "$srcdir/axon-$pkgver"
    python -m build --wheel --sdist --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/axon-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
