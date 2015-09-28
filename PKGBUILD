# Maintainer: Quan Guo <guotsuan@gmail.com>

pkgname=(python2-astroml-git python-astroml-git)
pkgbase=python2-astroml-git
_pkgname=astroML
pkgver=2015.07.15.gb9e783d
pkgrel=2
pkgdesc="AstroML is a Python module for machine learning and data mining built on numpy, scipy, scikit-learn, and matplotlib."

url='http://www.astroml.org/'
arch=('any')
license=('BSD-3-Clause')

depends=('python-numpy' 'python2-numpy' 'python-scipy' 'python2-scipy' 
         'python-scikit-learn' 'python2-scikit-learn' 'python-matplotlib'
         'python2-matplotlib')

optdepends=('astroml-examples-git')

source=("git+https://github.com/astroML/astroML.git")


conflicts=('python2-astroml' )
#provides=('astroml')
md5sums=('SKIP')


prepare() {
  cp -a ${_pkgname}{,-py2}

}

pkgver() {
      cd "${srcdir}/${_pkgname}"
      git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package_python-astroml-git() {
  conflicts=('python-astroml' )
  optdepends=('astroml-examples-git' 'python-addons-git')
  provides=('python-astroml')

  cd "${srcdir}/${_pkgname}"
  python ./setup.py install --root="${pkgdir}" --prefix=/usr

  #install -dm755 ${pkgdir}/usr/share/astroML/examples/{algorithms,datasets,learning}
  #install -D -m644 examples/algorithms/* \
    #${pkgdir}/usr/share/astroML/examples/algorithms
  #install -D -m644 examples/datasets/* \
    #${pkgdir}/usr/share/astroML/examples/datasets
  #install -D -m644 examples/learning/* \
    #${pkgdir}/usr/share/astroML/examples/learning
  #install -D -m644 examples/README.rst ${pkgdir}/usr/share/astroML/examples

}

package_python2-astroml-git() {
  conflicts=('python2-astroml' )
  optdepends=('astroml-examples-git' 'python2-addons-git')
  provides=('python2-astroml')

  cd "${srcdir}/${_pkgname}-py2"
  python2 ./setup.py install --root="${pkgdir}" --prefix=/usr

  #install -dm755 ${pkgdir}/usr/share/astroML/examples/{algorithms,datasets,learning}
  #install -D -m644 examples/algorithms/* \
    #${pkgdir}/usr/share/astroML/examples/algorithms
  #install -D -m644 examples/datasets/* \
    #${pkgdir}/usr/share/astroML/examples/datasets
  #install -D -m644 examples/learning/* \
    #${pkgdir}/usr/share/astroML/examples/learning
  #install -D -m644 examples/README.rst ${pkgdir}/usr/share/astroML/examples

}

