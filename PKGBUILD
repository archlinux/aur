# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-cmap
_pkgname=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc='Scientific colormaps for python, without dependencies'
arch=('any')
url='https://github.com/tlambert03/cmap'
license=('BSD 3-Clause')
depends=('python-numpy')
makedepends=('python-build' 'python-hatch-vcs' 'python-installer')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('28d5c99de241648d3985ca69f65b4a43d342ddaf23ce28313f2f24e2b4c664d7')

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
