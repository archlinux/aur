# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>

pkgname=('python-rebulk' 'python2-rebulk')
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=2
pkgdesc="Define simple search patterns in bulk to perform advanced matching on any string. "
arch=("any")
url="https://github.com/Toilal/rebulk"
license=('MIT')
makedepends=('python-setuptools'
             'python2-setuptools')
options=(!emptydirs)

# The pypi source is different from github.
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("rebulk-${pkgver}.tar.gz::https://github.com/Toilal/rebulk/archive/v${pkgver}.tar.gz")

sha512sums=('eb474b8b8509f291938bc3c96ef591b8233a41b9eb28f7957f3d20e098140ac6d80a1337c6ff1c89eeea4c34f94eb37af811d2200a8f2a574fc93b8fa1ea3c5d')

prepare() {
  cp -a "rebulk-${pkgver}"{,-py2}
}

check() {
  cd "${srcdir}/rebulk-${pkgver}"
  python setup.py test
}

package_python-rebulk() {
  depends=(
    'python'
    'python-six'
  )
  optdepends=(
    'python-regex'
  )
  cd "${srcdir}/rebulk-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-rebulk() {
  depends=(
    'python2'
    'python2-six'
  )
  optdepends=(
    'python2-regex'
  )
  cd "${srcdir}/rebulk-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
