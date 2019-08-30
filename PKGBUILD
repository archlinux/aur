# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>

pkgname=('python-rebulk' 'python2-rebulk')
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="Define simple search patterns in bulk to perform advanced matching on any string. "
arch=("any")
url="https://github.com/Toilal/rebulk"
license=('MIT')
makedepends=('python-setuptools'
             'python2-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('e42bc73645eaa33ee321d69d5091c0a11e47ade0b2b48ba78b8b682e327f0608bb4345e7be7e51551b672bbfd6de490bc563e12344da30be6900b5860b9047ab')

prepare() {
  cp -a "rebulk-${pkgver}"{,-py2}
}

check() {
  cd "${srcdir}/rebulk-${pkgver}"
  python setup.py test

  # Tests don't work in python2, issue Toilal/rebulk/issues/19
  #cd "${srcdir}/rebulk-${pkgver}-py2"
  #python2 setup.py test
}

package_python-rebulk() {
  depends=('python'
           'python-six'
           'python-regex')
  cd "${srcdir}/rebulk-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-rebulk() {
  depends=('python2'
           'python2-six'
           'python2-regex'
           'python2-ordereddict')
  cd "${srcdir}/rebulk-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
