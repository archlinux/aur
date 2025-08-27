# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Truocolo <truocolo@aol.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Arvid Ephraim Picciani <aep@exys.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>

_name="pyparsing"
pkgname="python2-${_name}"
pkgver=2.4.7
pkgrel=7
pkgdesc="General parsing module for Python"
arch=('any')
url="https://github.com/${_name}/${_name}"
license=('MIT')
depends=(
  'python2>=2.6'
)
makedepends=(
  'python2-setuptools'
)
_pkgsrc="${_name}-${_name}_${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${_name}_${pkgver}.zip")
sha512sums=('f7f49bc1b086bf41ea3bc44378ee284f7868c8a0fe7493457e55fc38dd32ed810ca0dc6f4ca5e02686566f3c96c8ebabcd93321cda09a929cbf4f2c77b4f76cf')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  python2 unitTests.py
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  python2 setup.py install --root="${pkgdir}" --optimize=1

  install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.rst" "CHANGES"
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
