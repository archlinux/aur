# Maintainer: <https://aur.archlinux.org/account/zeauw>

_name=gwpy
pkgname=python-${_name}
pkgver=3.0.10
pkgrel=1
pkgdesc="Package for analysing and characterising gravitational wave data in python"
arch=('any')
url='https://gitlab.com/gwpy/gwpy'
license=('GPLv3')
depends=('python-astropy'
    'python-dateparser'
    'python-dqsegdb2'
    'python-gwdatafind'
    'python-gwosc'
    'python-h5py'
    'python-ligo-segments'
    'python-ligotimegps'
    'python-matplotlib'
    'python-numpy'
    'python-dateutil'
    'python-requests'
    'python-scipy'
    'python-tqdm')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer')
source=("gwpy-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/gwpy-v${pkgver}.tar.gz")
sha256sums=('26b8c2a43e8ebbc0b63e0d4ae1bd8a5ef8340b9f556a012600904669f979ef0c')

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    cd gwpy-v${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd gwpy-v${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
