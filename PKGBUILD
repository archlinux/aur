# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=dill
pkgname=pypy3-${_base}
pkgver=0.4.0
pkgrel=1
pkgdesc="serialize all of python"
arch=(any)
url="https://github.com/uqfoundation/${_base}"
license=(MIT)
optdepends=('python-objgraph: graph support')
depends=(pypy3)
makedepends=(pypy3-setuptools)
source=(${url}/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('c7c2230146a8ffdad89883db47fe59363459533f2d73dbf8528cb773f0ade33567b9852e45789b4c2c84afee0d381cc6039c545135f6a55a515884357d40a3f0')

build() {
  cd ${_base}-${pkgver}
  pypy3 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1 --skip-build
  mkdir -p "$pkgdir/usr"
  mv "${pkgdir}/opt/pypy3/bin" "$pkgdir/usr/bin"
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
