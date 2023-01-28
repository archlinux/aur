# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-flatbencode
pkgver=0.2.1
pkgrel=4
pkgdesc='Fast, safe and non-recursive implementation of Bittorrent bencoding'
arch=('any')
url='https://github.com/acatton/flatbencode/'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-hypothesis')
source=("https://github.com/acatton/flatbencode/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('867da7bf5106909dc16cc6c6b4a99a2d42b0f5770600a84115ed04bfdec9e44d')

build() {
    cd "flatbencode-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "flatbencode-${pkgver}"
    pytest
}

package() {
    cd "flatbencode-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../lib/python${_pyver}/site-packages/flatbencode-${pkgver}.dist-info/LICENSE" \
        "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
