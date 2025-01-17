# Maintainer: Bennett Piater <bennett at piater dot name>
pkgname='diceware'
pkgver=1.0.1
pkgrel=1
pkgdesc='Wordlist-based password generator'
url="https://github.com/ulif/diceware/"
depends=('python')
makedepends=(
    'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
    'python-sphinx'
    'python-sphinx_rtd_theme'
    )
checkdepends=(
    'python-pytest'
    'python-pytest-cov'
    'python-coverage'
)
license=('GPL-3.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a3686a48b8c97341d53e17d0f0c13775ddffde51ee271870072c731f05aa1bb')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
    rst2man docs/manpage.rst > dist/diceware.1
}

check() {
    cd "${pkgname}-${pkgver}"
    python -m pytest
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 dist/diceware.1 -t "$pkgdir"/usr/share/man/man1/
}

# vim:set ts=2 sw=2 et
