# Maintainer: Manuel Kauschinger <admin bruzzzla de>
# Contributor: Serkan Hosca <serkan@hosca.com>

pkgbase=python-aspy-yaml
pkgname=(python-aspy-yaml python2-aspy-yaml)
pypi_name=aspy.yaml
pkgver=1.3.0
pkgrel=1
pkgdesc="A few extensions to pyyaml"
arch=('any')
license=('MIT')
url="https://github.com/asottile/aspy.yaml"
depends=('python')
source=("https://pypi.io/packages/source/a/${pypi_name}/${pypi_name}-${pkgver}.tar.gz")
md5sums=('1959a34873a6bdc1fba807023804867e')

prepare() {
  cp -a ${pypi_name}-${pkgver}{,-python2}
}

build() {
  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${pypi_name}-${pkgver}-python2"
  python2 setup.py build
}

package_python-aspy-yaml() {
  pkgdesc='Python 3 extensions to pyyaml'
  depends=('python' 'python-yaml')

  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

package_python2-aspy-yaml() {
  pkgdesc='Python 2 extensions to pyyaml'
  depends=('python2' 'python-yaml')

  cd "${srcdir}/${pypi_name}-${pkgver}-python2"
  python2 setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

# vim: set ft=sh ts=4 sw=4 noet:
