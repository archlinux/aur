# Maintainer: <https://aur.archlinux.org/account/zeauw>

_name=gwosc
pkgname=python-${_name}
pkgver=0.7.1
pkgrel=1
pkgdesc="A python interface to the Gravitational-Wave Open Data Center archive"
arch=('any')
url='https://git.ligo.org/gwosc/client'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-setuptools-scm')
source=("client-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/client-v${pkgver}.tar.gz")
sha256sums=('d03b87c222c4f5235fb8a04d5b3841d60893b3fa400126b1b7ce0cb1e911f8c3')

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    cd client-v${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd client-v${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
