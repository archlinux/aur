# Maintainer : Evert Vorster <superchief AT evertvorster DOT com>

pkgname=python-srt_equalizer
_pkgname=srt_equalizer
pkgver=v0.1.3
_pkgver=0.1.3
pkgrel=1
pkgdesc='A tool to transform subtitle lengths, splitting into multiple fragments if necessary'
arch=('any')
url='https://github.com/peterk/srt_equalizer'
license=('MIT')
depends=('python-srt')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-nose' 'python-poetry')
checkdepends=('python-hypothesis' 'python-pytest')
#conflicts=('')
source=("https://github.com/peterk/$_pkgname/archive/refs/tags/$pkgver.zip")
sha256sums=('e580ad874cf76044ac0232ae33d3ecfe80cd0dfaf552230a4370598b270c70b6')

build() {
    cd "${_pkgname}-${_pkgver}"
    poetry build
# -m build --wheel --no-isolation
}

check() {
echo "Checking stage"
    cd "${_pkgname}-${_pkgver}"
    nosetests
}

package() {
    python -m installer --destdir="$pkgdir" "${_pkgname}-${_pkgver}/dist"/*.whl
    
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../lib/python${_pyver}/site-packages/${_pkgname}-${_pkgver}.dist-info/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
