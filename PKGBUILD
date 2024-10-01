# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=dill
pkgname=pypy3-${_base}
pkgver=0.3.9
pkgrel=1
pkgdesc="serialize all of python"
arch=(any)
url="https://github.com/uqfoundation/${_base}"
license=(MIT)
optdepends=('python-objgraph: graph support')
depends=(pypy3)
makedepends=(pypy3-setuptools)
source=(${url}/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('0dc553ca15ec842f658ec4a0d3970e38364ba1d758f7d444023c6c563d5e5a638e37f3b0ed3e032bca3f6c437fa0080f238323ca96ba2b5537bf2efea0bfe96b')

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

