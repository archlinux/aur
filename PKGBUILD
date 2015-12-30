# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgbase=sphinx-me
pkgname=('python-sphinx-me' 'python2-sphinx-me')
pkgver=0.3
pkgrel=1
pkgdesc="Wraps your README-only projects in a dynamic Sphinx shell for hosting on http://readthedocs.org"
arch=('any')
license=('BSD')
url="http://github.com/stephenmcd/sphinx-me/"
makedepends=('python2' 'python2-setuptools' 'python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/s/sphinx-me/sphinx-me-${pkgver}.tar.gz")
md5sums=('a0b11069d808a6bc4a8e533abff7bc02')

prepare() {
  cp -a "${srcdir}/${pkgbase}-${pkgver}" "${srcdir}/${pkgbase}-${pkgver}-python2"

  sed -i 's/sphinx-build/sphinx-build2/g' "${srcdir}/${pkgbase}-${pkgver}-python2/sphinx_me.py"
}

package_python-sphinx-me() {
  depends=('python')
  optdepends=('python-sphinx: For calling sphinx-build automatically')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1

  mv "${pkgdir}/usr/bin/sphinx-me"{,3}
  ln -s "/usr/bin/sphinx-me3" "${pkgdir}/usr/bin/sphinx-me"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-sphinx-me() {
  depends=('python2')
  optdepends=('python2-sphinx: For calling sphinx-build automatically')

  cd "${srcdir}/${pkgbase}-${pkgver}-python2"

  python2 setup.py install --root="${pkgdir}" -O1

  mv "${pkgdir}/usr/bin/sphinx-me"{,2}

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
