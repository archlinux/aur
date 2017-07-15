# Contributor: Serkan Hosca <serkan@hosca.com>

pypi_name=pathlib2
pkgbase="python-$pypi_name"
pkgname=("python-$pypi_name" "python2-$pypi_name")
pkgver=2.3.0
pkgrel=1
pkgdesc="Object-oriented filesystem paths for python"
arch=('any')
license=('MIT')
url="https://pypi.python.org/pypi/pathlib2/"
makedepends=('python' 'python2')
source=("https://pypi.io/packages/source/p/${pypi_name}/${pypi_name}-${pkgver}.tar.gz")
md5sums=('89c90409d11fd5947966b6a30a47d18c')

prepare() {
  cp -a ${pypi_name}-${pkgver}{,-python2}
}

build() {
  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${pypi_name}-${pkgver}-python2"
  python2 setup.py build
}

package_python-pathlib2() {
  pkgdesc="Python 3 client for ${pypi_name}"
  depends=('python' )

  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

package_python2-pathlib2() {
  pkgdesc="Python 2 client for ${pypi_name}"
  depends=('python2' )

  cd "${srcdir}/${pypi_name}-${pkgver}-python2"
  python2 setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

# vim: set ft=sh ts=4 sw=4 noet:
