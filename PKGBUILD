# Maintainer: Dani Rodriguez <dani@danirod.es>

pkgname='python-graphemeu'
_module='grapheme'
pkgver='0.11.0'
pkgrel=1
pkgdesc="Unicode grapheme helpers (updated fork of python-grapheme)"
url="https://github.com/timendum/grapheme"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=('python-grapheme')
conflicts=('python-grapheme')
license=('MIT')
arch=('any')
source=("${_module}-${pkgver}.tar.gz::https://github.com/timendum/${_module}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cd00c9d3abb8a691ddcc07d024ab420e572600f853c85e98bf42645b2c77ee56')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m pytest
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}/" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
