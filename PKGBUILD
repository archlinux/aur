# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=cmap
pkgname=python-${_pkgname}
pkgver=0.7.2
pkgrel=1
pkgdesc='Scientific colormaps for python, with only numpy dependency'
arch=('any')
url='https://github.com/pyapp-kit/cmap'
license=('BSD 3-Clause')
depends=('python-numpy')
makedepends=('python-build' 'python-hatch-vcs' 'python-installer')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4895f54f91807687ebfc27b488c6da4092e8caa66224b89127e51e66516f5f20')

build() {
    cd "${_pkgname}-${pkgver}" || exit

    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}" || exit

    python -m installer --destdir=${pkgdir} dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSES/BSD-3-Clause.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
