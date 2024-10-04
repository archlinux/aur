# Maintainer: <https://aur.archlinux.org/account/zeauw>

_name=gwdatafind
pkgname=python-${_name}
pkgver=1.2.0
pkgrel=1
pkgdesc="The client library for the GWDataFind service"
arch=('any')
url='https://git.ligo.org/computing/gwdatafind/client'
license=('GPLv3')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("client-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/client-${pkgver}.tar.gz")
sha256sums=('025307223131ed447139a4d12a6e5f6a3ebe4ae5ed516a706ee2015e88bd7ffe')

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    cd client-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd client-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
