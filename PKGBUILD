# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>
pkgname='python-nine'
_pkgbase="${pkgname#python-}"
pkgver=1.1.0
pkgrel=7
arch=('any')
pkgdesc="Python 3/2 compatibility library, allowing to add py2 compat to py3 code"
url="https://github.com/nandoflorestan/nine/"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/nandoflorestan/nine/archive/v${pkgver}.tar.gz")
sha512sums=('b445cd1f324a0d2045081226fb650eebd8dbc86942faff204c19fffc022f0190fc04abec563b107cb860202d29f08c132056b1098495471fdfda104e57878828')

check() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python -m unittest discover -vs .
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python ./setup.py install --root="$pkgdir/" --optimize=1
  install -D -m0644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
