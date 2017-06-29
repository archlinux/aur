# Contributor: Serkan Hosca <serkan@hosca.com>

pkgbase=python-pre-commit
pkgname=(python-pre-commit python2-pre-commit)
pypi_name=pre_commit
pkgver=0.14.3
pkgrel=1
pkgdesc="A framework for managing and maintaining multi-language pre-commit hooks."
arch=('any')
license=('MIT')
url="http://pre-commit.com/"
depends=('python')
source=("https://pypi.io/packages/source/p/${pypi_name}/${pypi_name}-${pkgver}.tar.gz")
md5sums=('9254716ba7e6230e9927bee276c076d4')

prepare() {
  cp -a ${pypi_name}-${pkgver}{,-python2}
}

build() {
  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${pypi_name}-${pkgver}-python2"
  python2 setup.py build
}

package_python-pre-commit() {
  pkgdesc='Python 3 client for pre-commit'
  depends=('python' 'python-nodeenv' 'python-aspy-yaml' 'python-virtualenv' 'python-cached-property')

  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

package_python2-pre-commit() {
  pkgdesc='Python 2 client for pre-commit'
  depends=('python2' 'python2-nodeenv' 'python2-aspy-yaml' 'python-virtualenv' 'python-cached-property')

  cd "${srcdir}/${pypi_name}-${pkgver}-python2"
  python2 setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
  mv ${pkgdir}/usr/bin/pre-commit ${pkgdir}/usr/bin/pre-commit2
}

# vim: set ft=sh ts=4 sw=4 noet:
