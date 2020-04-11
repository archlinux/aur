# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-traces-git
pkgver=0.5.1.r21.gc15ed57
pkgrel=1
pkgdesc="Python library for unevenly-spaced time series analysis"
url="https://traces.readthedocs.io/"
depends=(python-infinity)
makedepends=(git python-setuptools)
provides=(python-traces)
conflicts=(python-traces)
license=(MIT)
arch=(any)
source=("git+https://github.com/datascopeanalytics/traces.git")
sha256sums=(SKIP)


pkgver() {
    cd traces
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd traces
    python setup.py build
}

package() {
    cd traces
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-traces-git/LICENSE"
}
