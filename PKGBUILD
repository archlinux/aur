# Maintainer: Frederic Van Assche <frederic@fredericva.com>
_base=xraydb
pkgname=python-${_base}
pkgver=4.4.7
pkgrel=1
pkgdesc="X-ray reference data in SQLite library with Python interface"
arch=(x86_64)
url="https://github.com/xraypy/XrayDB"
license=(Public Domain)
depends=(python-numpy python-scipy python-sqlalchemy)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_base::1}/$_base/$_base-$pkgver.tar.gz)
sha512sums=('a8103a0c5dfb07766e2f9a45c6a120491fdf76cca643d39e82b2849c4b8a01fa0640b9c74c1ad84dd6c2b1d06967a789e6be55bfdb6535090f9392ed73ada05e')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
