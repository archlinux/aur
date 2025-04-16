# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-cmap
_pkgname=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc='Scientific colormaps for python, with only numpy dependency'
arch=('any')
url='https://github.com/pyapp-kit/cmap'
license=('BSD 3-Clause')
depends=('python-numpy')
makedepends=('python-build' 'python-hatch-vcs' 'python-installer')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0fc76e90753d831265e173720de24224afba799888c55b87dfc1db33427f3b52')

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
