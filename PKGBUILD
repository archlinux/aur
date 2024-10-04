# Maintainer: <https://aur.archlinux.org/account/zeauw>

_name=igwn-auth-utils
pkgname=python-${_name}
pkgver=1.1.1
pkgrel=1
pkgdesc="Python authorisation utilities for IGWN."
arch=('any')
url='https://git.ligo.org/computing/software/igwn-auth-utils'
license=('BSD 3-Clause')
depends=('python-cryptography' 'python-requests' 'python-safe-netrc' 'python-scitokens')
makedepends=('python-setuptools' 'python-wheel' 'python-setuptools-scm' 'python-build' 'python-installer')
source=("${_name}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/igwn-auth-utils-${pkgver}.tar.gz")
sha256sums=('c2f8f6b188b5c9dc8f9e8aa5ea739423c02f05c03b41319f051a5442ba1bb52c')

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    cd ${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
