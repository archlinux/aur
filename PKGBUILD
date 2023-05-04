# Maintainer: Steffen Schneider <stes@hey.com>
pkgname=python-literate-dataclasses
_pkgname=literate_dataclasses
pkgver=0.0.6
pkgrel=1
pkgdesc="A simple dataclasses wrapper for easier documentation of dataclasses"
url="https://github.com/stes/literate-dataclasses"
depends=()
makedepends=(
    python-pytest
)
optdepends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/55/6e/4dec6ba9484821799bab1b529e37cdae6d05dd2caf8ab61746a5e4bca4fa/literate_dataclasses-${pkgver}.tar.gz")
md5sums=('53bbc23a70350ce020a08e1719970f2e')

_site_packages=$(python -c 'import sys; print(sys.path[-1])')

build() {
    cd $srcdir/${_pkgname}-${pkgver}
	python3 -m build --wheel
}

package() {
    cd $srcdir/${_pkgname}-${pkgver}
    pip install --ignore-installed --no-deps --root="${pkgdir}" dist/${_pkgname}-${pkgver}-py3-none-any.whl 
    find ${pkgdir} -iname __pycache__ -exec rm -r {} \; 2>/dev/null || echo
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
