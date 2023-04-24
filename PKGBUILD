# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=python-syncedlyrics
_pkgname=syncedlyrics
pkgver=0.5.0
pkgrel=1
pkgdesc='Get an LRC format (synchronized) lyrics for your music'
arch=('any')
url='https://github.com/rtcq/syncedlyrics'
license=('MIT')
depends=('python>=3.7' 'python-requests>=2.28.1' 'python-rapidfuzz>=2.13.2' 
        'python-beautifulsoup4>=4.11.1')
makedepends=('python-build' 'python-installer' 'python-wheel'
            'python-poetry-core')
checkdepends=('python-pytest')
conflicts=("${pkgname}-git")
source=("${_pkgname}-${pkgver}".tar.gz::"https://github.com/rtcq/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('82d4315d753875c8e483dfad95e9c13bc5136fbd62e06bda6ce7b33b18c1fe26')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    GIT_DIR=. python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    pytest tests.py
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
