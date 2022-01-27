# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Bailey Fox <bfox200012@gmail.com>

pkgname=('python-crccheck')
_module=${pkgname#python-}
pkgver='1.1'
pkgrel=2
pkgdesc="Calculation library for CRCs and checksums"
url="https://sourceforge.net/projects/crccheck"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('45962231cab62b82d05160553eebd9b60ef3ae79dc39527caef52e27f979fa96')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    python_version="$(python -c "import sys;v=sys.version_info;print(f'{v[0]}.{v[1]}')")"
    rm -r ${pkgdir}/usr/lib/python${python_version}/site-packages/tests/
}
