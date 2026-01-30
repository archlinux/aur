# SPDX-License-Identifier: 0BSD
# Maintainer: Emma Welker <code at nuew dot net>
_name=Pymem
pkgname="python-${_name/P/p}"
pkgver=0.14.0
pkgrel=1
pkgdesc="A Python library to manipulate Windows processes"
arch=(x86_64)
url="https://github.com/srounet/Pymem"
license=(MIT)
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-poetry'
             'python-setuptools'
             'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f08726e41f756d2204c5e85c765d0e23a2f9512e8b0e6c0a2206b521f0fdd35c')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
