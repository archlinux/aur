# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
_py_pkgname=sphinx-autobuild
pkgname=python-${_py_pkgname}
pkgver=0.7.1
pkgrel=2
pkgdesc="Watch a Sphinx directory and rebuild the documentation when a change is detected. Also includes a livereload enabled web server."
arch=('any')
url="https://github.com/GaretJax/sphinx-autobuild"
license=('MIT')
depends=(
  'python-sphinx'
  'python-watchdog'
  'python-argh'
  'python-pathtools'
  'python-yaml'
  'python-tornado'
  'python-port-for'
  'python-livereload'
)
checkdepends=('python-pytest' 'python-mock')
source=("https://files.pythonhosted.org/packages/source/${_py_pkgname::1}/${_py_pkgname}/${_py_pkgname}-${pkgver}.tar.gz")
sha256sums=('66388f81884666e3821edbe05dd53a0cfb68093873d17320d0610de8db28c74e')

build() {
    cd "${srcdir}/${_py_pkgname}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_py_pkgname}-${pkgver}"
    
    py.test
}

package() {
  cd "${srcdir}/${_py_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
