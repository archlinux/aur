# Maintainer: Dani Rodriguez <dani@danirod.es>

pkgname='python-graphemeu'
_module='grapheme'
pkgver='0.10.0'
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
sha256sums=('89fe9c2fb80210addeab7ea4db0a6270fc6d4d2c4387a95ed3fb89a1c317674a')

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
