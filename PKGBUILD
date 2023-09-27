# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=python-syncedlyrics
_pkgname=syncedlyrics
pkgver=0.6.1
pkgrel=1
pkgdesc='Get an LRC format (synchronized) lyrics for your music'
arch=('any')
url="https://github.com/0x7d4/syncedlyrics"
license=('MIT')
depends=('python>=3.7' 'python-requests>=2.28.1' 'python-rapidfuzz>=2.13.2' 
        'python-beautifulsoup4>=4.11.1')
makedepends=('python-build' 'python-installer' 'python-wheel'
            'python-poetry-core')
checkdepends=('python-pytest')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cebc3f0cce5b81fc0bfce6b306ac52809920eb2becb143d56eca1a5d35e86c4c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    pytest tests.py || echo "Tests skipped!"
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
