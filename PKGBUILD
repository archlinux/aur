# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=python-syncedlyrics
_pkgname=syncedlyrics
pkgver=0.7.0
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
sha256sums=('b9800562e6ee40800b5e22d9b69b79d98a8915a14ea3b334c230fd1dc99bff4c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
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
