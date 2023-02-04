# Maintainer: Major <majorx234@googlemail.com>
pkgname=python-inputs
_pyname=${pkgname#python-}
pkgver=0.5
pkgrel=3
pkgdesc="Cross-platform Python support for keyboards, mice and gamepads"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/zeth/$_pyname"
license=(BSD)
makedepends=(python-build
             python-installer
             python-wheel
             python-setuptools-scm)

source=("https://github.com/zeth/inputs/archive/refs/tags/v${pkgver}.zip"
        3203c9e25f1e14c4316d85d59c536b4e407f569f.patch)
sha256sums=('04eebe43372a3fceb14bc93ef2ef120fbe6409d7a61c66f8c3e47f60aa7b1e23'
            '92c69faff3038a42eb0fc4dfefe2657dea1e5cf0cea05c14d02ba04decdcc139')
prepare() {
    cd "$srcdir/${_pyname}-$pkgver"
    patch -p1 -i "$srcdir"/3203c9e25f1e14c4316d85d59c536b4e407f569f.patch
}

build() {
    cd "$srcdir/${_pyname}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pyname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Install LICENSE file
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Install README file
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
