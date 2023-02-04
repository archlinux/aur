# Maintainer: Major <majorx234@googlemail.com>
pkgname=python-inputs
_pyname=${pkgname#python-}
pkgver=0.5
pkgrel=2
pkgdesc="Cross-platform Python support for keyboards, mice and gamepads"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/zeth/$_pyname"
license=(BSD)
makedepends=(python-build
             python-installer
             python-wheel
             python-setuptools-scm
             git)

source=("$pkgname"::"git+https://github.com/zeth/inputs.git"#tag=v${pkgver}
        3203c9e25f1e14c4316d85d59c536b4e407f569f.patch)
sha256sums=('SKIP'
            '92c69faff3038a42eb0fc4dfefe2657dea1e5cf0cea05c14d02ba04decdcc139')
prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 -i "$srcdir"/3203c9e25f1e14c4316d85d59c536b4e407f569f.patch
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Install LICENSE file
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Install README file
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
