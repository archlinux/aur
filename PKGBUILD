# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=inputs
pkgname=python-inputs-git
pkgver=0.5.r3.g5e33e03
pkgrel=1
pkgdesc="Cross-platform Python support for keyboards, mice and gamepads - git version"
arch=('any')
url="https://github.com/zeth/inputs"
license=('BSD-3-Clause')
provides=('python-inputs')
conflicts=('python-inputs')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-wheel' 'git')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_base}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_base}"
    git -C "${srcdir}/${_base}" clean -dfx
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
