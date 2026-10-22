# Maintainer: Frederic Van Assche <frederic@fredericva.com>
_base=xraydb
pkgname=python-${_base}
pkgver=4.5.8
pkgrel=1
pkgdesc="X-ray reference data in SQLite library with Python interface"
arch=(x86_64)
url="https://github.com/xraypy/XrayDB"
license=(Public Domain)
depends=("python-numpy>=2" "python-scipy>=1.13" "python-sqlalchemy>=2.0.1")
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_base::1}/$_base/$_base-$pkgver.tar.gz)
sha512sums=('f53597b90d4e24ae897597512ebf16f97406aa260e9d0a9ec73e3ab7023202dae789033a6662e474f9cd46846deacf8ffada269fcc484468bea21c8d5ec23339')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
