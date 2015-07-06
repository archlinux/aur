# Contributor: Erik Johnson <palehose at gmail dot com>

pkgbase=ptpython
pkgname=("${pkgbase}" "${pkgbase}2")
pkgver=0.8
pkgrel=1
pkgdesc="An advanced Python REPL, built on top of the prompt_toolkit library"
arch=(any)
url="https://pypi.python.org/pypi/${pkgbase}"
license=('CUSTOM')
source=("https://pypi.python.org/packages/source/p/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=(342d966c6671f9cc57f7dc8eec2595411ad1cca0e3da25e0997f9812431cf4c0)

prepare() {
  cp -a ${pkgbase}-${pkgver}{,-py2}
}

package_ptpython() {
  depends=('python-prompt_toolkit' 'python-jedi>=0.8.1' 'python-docopt')
  makedepends=('python-setuptools')
  optdepends=('ipython: ptipython (ptpython iPython wrapper)')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_ptpython2() {
  depends=('python2-prompt_toolkit' 'python2-jedi>=0.8.1' 'python2-docopt')
  makedepends=('python2-setuptools')
  optdepends=('ipython2: ptipython2 (ptpython iPython wrapper)')

  cd "${srcdir}/${pkgbase}-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1
  mv "${pkgdir}/usr/bin/ptpython"{,2}
  mv "${pkgdir}/usr/bin/ptipython"{,2}
}

