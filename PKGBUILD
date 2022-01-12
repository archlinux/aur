# Contributor: Felix Golatofski <contact@xdfr.de>
_base=django-cms
pkgname=python-${_base}
pkgver=3.9.0
pkgrel=1
pkgdesc="An Advanced Django CMS"
url="https://${_base}.org"
arch=('any')
license=('custom')
depends=(python-django-classy-tags python-django-formtools python-treebeard python-django-sekizai python-djangocms-admin-style)
makedepends=(python-setuptools)
source=(https://github.com/${_base}/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('f5241eaa824ea7eb31b678bbd59c2fa7097fcff2f69c15bbf3660dce1bfa2ab43d891025edb4d2f135e9218fbbd1435811f250ea6db04168336e1fe0474c9db1')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
