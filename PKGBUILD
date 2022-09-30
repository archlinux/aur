# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

# shellcheck disable
_name="appdirs"
pkgname=("python2-${_name}")
pkgver=1.4.4
pkgrel=6
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir".'
arch=('any')
url="https://github.com/ActiveState/${_name}"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/a/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('8b0cdd9fd471d45b186aa47607691cf378dabd3edc7b7026a57bd6d6f57698e86f440818a5e23ba4288b35d6bb8cb6eb0106eae8aab09d8863ee15025d300883')

prepare() {
  cp -a "${_name}-${pkgver}"{,-py2}
}

build() {
  cd "${srcdir}/${_name}-${pkgver}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_name}-${pkgver}-py2"
  python2 setup.py test
}

package() {
  depends=('python2')

  cd "${_name}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
