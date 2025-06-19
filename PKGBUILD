# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-cmap
_pkgname=${pkgname#python-}
pkgver=0.6.1
pkgrel=1
pkgdesc='Scientific colormaps for python, with only numpy dependency'
arch=('any')
url='https://github.com/pyapp-kit/cmap'
license=('BSD 3-Clause')
depends=('python-numpy')
makedepends=('python-build' 'python-hatch-vcs' 'python-installer')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b7d0d93c8c65c49ed5001cecdcc19c83b9cebd348af2b6644d7d6df6e5d6895b')

build() {
    cd "${_pkgname}-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir=${pkgdir} dist/*.whl
    install -Dm644 LICENSE/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
