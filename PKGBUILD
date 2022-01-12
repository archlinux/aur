# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=cyvcf2
pkgname=python-${_base}
pkgver=0.30.14
pkgrel=1
pkgdesc="fast vcf parsing with cython + htslib"
arch=('any')
url="https://pypi.python.org/pypi/${_base}"
license=(MIT)
depends=(python-numpy python-coloredlogs python-click htslib)
makedepends=(cython python-setuptools)
# options=(!emptydirs)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('588d7bed6e29780f1ff10e09276172613e5bf478647eb0cd2566c62c8e0eca586648dfc5e88917ae07e8b2a2c32ba262f9dcf4f38e43fe50a7414cc0336501e4')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
