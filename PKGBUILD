# Maintainer: Quan Guo <guotsuan@gmail.com>

pkgname=python2-astroml-git
_pkgname=astroML
pkgver=2015.01.28.g8e1bfcb
pkgrel=1
pkgdesc="AstroML is a Python module for machine learning and data mining built on numpy, scipy, scikit-learn, and matplotlib."

url='http://www.astroml.org/'
arch=('any')
license=('BSD-3-Clause')
depends=('python2-numpy' 'python2-scipy' 'python2-scikit-learn'
          'python2-matplotlib')

source=("git+https://github.com/astroML/astroML.git")


conflicts=('python2-astroml' 'astroml-examples')
#provides=('astroml')
md5sums=('SKIP')


pkgver() {
      cd "${srcdir}/${_pkgname}"
      git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"
  python2 ./setup.py install --root="${pkgdir}" --prefix=/usr
  #python2 ./setup_addons.py install --root="${pkgdir}" --prefix=/usr
  install -dm755 ${pkgdir}/usr/share/astroML/examples/{algorithms,datasets,learning}
  install -D -m644 examples/algorithms/* \
    ${pkgdir}/usr/share/astroML/examples/algorithms
  install -D -m644 examples/datasets/* \
    ${pkgdir}/usr/share/astroML/examples/datasets
  install -D -m644 examples/learning/* \
    ${pkgdir}/usr/share/astroML/examples/learning
  install -D -m644 examples/README.rst ${pkgdir}/usr/share/astroML/examples

}
