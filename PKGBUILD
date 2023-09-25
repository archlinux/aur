# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=inputs
pkgname=python-inputs-git
pkgver=0.5.r2.ga46681d
pkgrel=1
pkgdesc="Cross-platform Python support for keyboards, mice and gamepads - git version"
arch=('any')
url="https://github.com/zeth/inputs"
license=(BSD)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-wheel' 'git')
source=("git+${url}.git"
        3203c9e25f1e14c4316d85d59c536b4e407f569f.patch)
sha256sums=('SKIP'
            '92c69faff3038a42eb0fc4dfefe2657dea1e5cf0cea05c14d02ba04decdcc139')

pkgver() {
  cd "${_base}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_base}"
    patch -p1 -i "$srcdir"/3203c9e25f1e14c4316d85d59c536b4e407f569f.patch
}

build() {
    cd "${_base}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_base}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Install LICENSE file
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Install README file
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
