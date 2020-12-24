# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>

pkgname=('python-rebulk' 'python2-rebulk')
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=1
pkgdesc="Define simple search patterns in bulk to perform advanced matching on any string. "
arch=("any")
url="https://github.com/Toilal/rebulk"
license=('MIT')
makedepends=('python-setuptools'
             'python2-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('f1b2dffad68d7cc3e8a6949c3605a6c0fe503cf59434cdff99952dc836839ecb3d411d244cf0e54069672fec9a6c4826efff3b7777f7e0557c667f947ec2bd74')

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
