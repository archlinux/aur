# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-glog
pkgver=0.3.1
pkgrel=6
pkgdesc='A simple Google-style logging wrapper for Python'
arch=('any')
url='https://github.com/benley/python-glog/'
license=('BSD')
depends=('python' 'python-gflags' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/benley/python-glog/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b01af6f1118d2fa769c7657971deac8cecd71a3c6afe3e08328366740e802351')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" "${pkgname}-${pkgver}/dist"/*.whl

    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../lib/python${_pyver}/site-packages/glog-${pkgver}.dist-info/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
