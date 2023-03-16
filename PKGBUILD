# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-syncedlyrics
_pkgname=syncedlyrics
pkgver=0.4.0
pkgrel=2
pkgdesc='Get an LRC format (synchronized) lyrics for your music'
arch=('any')
url='https://github.com/rtcq/syncedlyrics'
license=('MIT')
depends=('python>=3.7' 'python-requests>=2.28.1' 'python-rapidfuzz>=2.13.2' 
        'python-beautifulsoup4>=4.11.1')
makedepends=('python-build' 'python-installer' 'python-wheel'
            'python-poetry-core')
conflicts=("${pkgname}-git")
source=("${_pkgname}-${pkgver}".tar.gz::"https://github.com/rtcq/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('13672adb05ec6f51c3dafe6efb34b7379c3477f47ffaf9d87d9c1dbf70900956')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    GIT_DIR=. python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m unittest -v
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
