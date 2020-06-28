# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-pytest-httpserver
pkgver=0.3.4
pkgrel=1
pkgdesc='Python module for testing http clients without contacting the real http server'
arch=('any')
url='https://github.com/csernazs/pytest-httpserver/'
license=('MIT')
depends=('python' 'python-werkzeug')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-coverage' 'python-requests')
source=("https://github.com/csernazs/pytest-httpserver/archive/${pkgver}/pytest-httpserver-${pkgver}.tar.gz")
sha256sums=('94e7d93d554cc86963bd0215602954fa4c1c8642292845c68837069c5ea5c610')

build() {
    cd "pytest-httpserver-${pkgver}"
    python setup.py build
}

check() {
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    
    cd "pytest-httpserver-${pkgver}"
    python setup.py install --root="$(pwd)/tmp_install" --skip-build --optimize='1'
    PYTHONPATH="$(pwd)/tmp_install/usr/lib/python${_pyver}/site-packages" pytest
}

package() {
    cd "pytest-httpserver-${pkgver}"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
