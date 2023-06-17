# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Andre Kugland <kugland@gmail.com>

pkgname=python-srt
pkgver=3.5.3
pkgrel=1
pkgdesc='Tools and python library for parsing, modifying, and composing SRT files'
arch=('any')
url='https://github.com/cdown/srt/'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-hypothesis' 'python-pytest')
conflicts=('python-pysrt')
source=("https://github.com/cdown/srt/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('aca9b201ce4cace273cd4d129f4f002d4d43f9c159bed1fd8bea848611185f4d')

build() {
    cd "srt-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "srt-${pkgver}"
    pytest
}

package() {
    python -m installer --destdir="$pkgdir" "srt-${pkgver}/dist"/*.whl
    
    local _pyver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../lib/python${_pyver}/site-packages/srt-${pkgver}.dist-info/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
