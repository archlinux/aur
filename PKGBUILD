# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=python-syncedlyrics
pkgver=0.8.0
pkgrel=2
pkgdesc='Get an LRC format (synchronized) lyrics for your music'
arch=('any')
url='https://pypi.org/project/syncedlyrics'
license=('MIT')
depends=('python>=3.7' 'python-requests>=2.28.1' 'python-rapidfuzz>=2.13.2' 
        'python-beautifulsoup4>=4.11.1')
makedepends=('python-build' 'python-installer' 'python-wheel'
            'python-poetry-core')
checkdepends=('python-pytest')
_module="${pkgname#python-}"
_src_name="${_module/-/_}-${pkgver}"
source=("https://pypi.org/packages/source/${_module::1}/${_module}/${_src_name}.tar.gz")
sha256sums=('494f40a0b34bb9a9389bb4ea2966007e480cdb91cbcc873573fe1bf191e428c7')

build() {
    cd "${_src_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_src_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
