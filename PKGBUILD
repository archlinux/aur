# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=cmap
pkgname=python-${_pkgname}
pkgver=0.8.0
pkgrel=1
pkgdesc='Scientific colormaps for python, with only numpy dependency'
arch=('any')
url='https://github.com/pyapp-kit/cmap'
license=('BSD 3-Clause')
depends=('python-numpy')
makedepends=('python-build' 'python-hatch-vcs' 'python-installer')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fc70e047d3a17543c56493110d6606a92aec7b3e32c4775c00c9c063b1d50347')

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
