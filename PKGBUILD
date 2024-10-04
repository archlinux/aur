# Maintainer: <https://aur.archlinux.org/account/zeauw>

_name=dqsegdb2
pkgname=python-${_name}
pkgver=1.2.1
pkgrel=1
pkgdesc="Simplified DQSEGDB API interface"
arch=('any')
url='https://git.ligo.org/computing/software/dqsegdb2'
license=('GPLv3')
depends=('python-click' 'python-igwn-auth-utils' 'python-ligo-segments')
makedepends=('python-setuptools' 'python-wheel' 'python-setuptools-scm' 'python-build' 'python-installer')
source=("${_name}-${pkgver}.tar.gz::${url}/-/archive/1.2.1/dqsegdb2-1.2.1.tar.gz")
sha256sums=('bb72442abdf8df6daa719f17820639b6126c296b40c6b3936567756a6ac70a40')

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
