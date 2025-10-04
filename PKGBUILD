# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-nihtest
pkgver=1.9.1
pkgrel=1
pkgdesc='A testing tool for command line utilities'
arch=('any')
url='https://github.com/nih-at/nihtest/'
license=('BSD-3-Clause')
depends=(
    'python'
    'python-dateutil')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
source=("https://github.com/nih-at/nihtest/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a9099a95040eac1dc54ac201545994ed7822d537ebc280c2dbb034bf35a2225a')

build() {
    cd "nihtest-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" "nihtest-${pkgver}/dist"/*.whl
    
    local _sitepkgs
    _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sr "${pkgdir}${_sitepkgs}/nihtest-${pkgver}.dist-info/licenses/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
