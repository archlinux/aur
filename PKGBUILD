# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=dill
pkgname=pypy3-${_base}
pkgver=0.4.1
pkgrel=1
pkgdesc="serialize all of python"
arch=(any)
url="https://github.com/uqfoundation/${_base}"
license=(MIT)
optdepends=('python-objgraph: graph support')
depends=(pypy3)
makedepends=(pypy3-setuptools)
source=(${url}/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('288a1dd6b72db0d45a00373851ab819366576d970876aac1cc0c79966b182420368c05e8e38316a60938fea1cc714800aa2a491a30dd454e0ddad8e1134217e4')

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
