# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-cmap
_pkgname=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc='Scientific colormaps for python, without dependencies'
arch=('any')
url='https://github.com/pyapp-kit/cmap'
license=('BSD 3-Clause')
depends=('python-numpy')
makedepends=('python-build' 'python-hatch-vcs' 'python-installer')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e8174736cc6e8b46557687f48a1dfeee1f03af5606d94ff48144271329e6e59c')

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
