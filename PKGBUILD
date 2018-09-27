# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=readme_renderer
pkgbase="python-${_name//_/-}"
pkgname=("python-${_name//_/-}" "python2-${_name//_/-}")
pkgver=22.0
pkgrel=2
pkgdesc='Python library to safely render arbitrary README files into HTML'
arch=('any')
url="https://github.com/pypa/${_name}"
license=('Apache')
depends=()
makedepends=('python-setuptools' 'python2-setuptools' 'python-bleach>=2.1.0'
             'python2-bleach>=2.1.0' 'python-cmarkgfm>=0.2.0' 'python2-cmarkgfm>=0.2.0'
             'python-docutils>=0.13.1' 'python2-docutils>=0.13.1' 'python-future' 'python2-future'
             'python-pygments' 'python2-pygments' 'python-six' 'python2-six')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('237ca8705ffea849870de41101dba41543561da05c0ae45b2f1c547efa9843d2')


prepare() {
  cp -a "${srcdir}/${_name}-${pkgver}"{,-python2}
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py build
}

package_python-readme-renderer() {
  depends+=('python-bleach>=2.1.0' 'python-cmarkgfm>=0.2.0' 'python-docutils>=0.13.1'
            'python-future' 'python-pygments' 'python-six')
  conflicts=('python-readme')
  provides=('python-readme')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
}

package_python2-readme-renderer() {
  depends+=('python2-bleach>=2.1.0' 'python2-cmarkgfm>=0.2.0' 'python2-docutils>=0.13.1'
            'python2-future' 'python2-pygments' 'python2-six')
  conflicts=('python2-readme')
  provides=('python2-readme')

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
