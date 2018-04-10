# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=readme_renderer
pkgbase="python-${_name//_/-}"
pkgname=("python-${_name//_/-}" "python2-${_name//_/-}")
pkgver=18.1
pkgrel=1
pkgdesc='Python library to safely render arbitrary README files into HTML'
arch=('any')
url="https://github.com/pypa/${_name}"
license=('Apache')
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e18cab7f1b07412990df1b59e1be04e1538f514a5bba53ec8777bfc5aac27563')


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
  depends+=('python-bleach>=2.1.0' 'python-cmarkgfm' 'python-docutils' 'python-future'
            'python-pygments')
  conflicts=('python-readme')
  provides=('python-readme')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
}

package_python2-readme-renderer() {
  depends+=('python2-bleach>=2.1.0' 'python2-cmarkgfm' 'python2-docutils' 'python2-future'
            'python2-pygments')
  conflicts=('python2-readme')
  provides=('python2-readme')

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
