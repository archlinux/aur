# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

# shellcheck disable=SC2034
_name="resolvelib"
_pkgbase="python-${_name}"
pkgbase="python2-${_name}"
pkgname=("${pkgbase}")
pkgver=0.5.5
pkgrel=1
pkgdesc="Resolve abstract dependencies into concrete ones"
url="https://github.com/sarugaku/${_name}"
license=('ISC')
arch=(any)
makedepends=('python2-setuptools')
checkdepends=('python-commentjson' 'python-pytest-runner')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('3da39201c4472d45466750119282fc34591b6d79eb4e6e71ca3f221e43dceead213058b4b72bee00083e9885650a47486bd7496264fba10f623aec7c19dabf00')

build() {
  cd "${_name}-${pkgver}" || exit
  python2 setup.py build
}

check() {
  cd "${_name}-${pkgver}" || exit
  python setup.py pytest
}

# shellcheck disable=SC2154
package_python-resolvelib() {
  depends=('python')

  cd "${_name}-${pkgver}" || exit
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgbase}/
}

package() {
  depends=('python2')

  cd "${_name}-${pkgver}" || exit
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgbase}"
}
