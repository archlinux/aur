# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Arvid Ephraim Picciani <aep@exys.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>

# shellcheck disable=SC2034
_name="pyparsing"
_pkgbase="python-${_name}"
pkgbase="python2-${_name}"
pkgname=("${pkgbase}")
pkgver=2.4.7
pkgrel=1
pkgdesc='General parsing module for Python'
arch=('any')
url="https://github.com/${_name}/${_name}"
makedepends=('python2-setuptools')
license=('MIT')
source=("${url}/archive/${_name}_$pkgver.tar.gz")
sha512sums=('c7a546729f86a2b5176e2482b566b9fd715b03e495aaef4d720b21307bb03f385dbc849247f8d266cb3d92be0a83c34ce4995b655ce85318355d5a0d42d6991e')

build() {
  cd "${_name}-${_name}_${pkgver}" || exit
  python2 setup.py build
}

check() {
  cd "${_name}-${_name}_${pkgver}" || exit
  python2 unitTests.py
}

# shellcheck disable=SC2154
package() {
  depends=('python2')

  cd "${_name}-${_name}_${pkgver}" || exit

  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
