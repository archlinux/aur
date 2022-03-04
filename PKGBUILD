# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_pkgname=lupa
pkgname="python-${_pkgname}-luajit"
pkgver=1.13
pkgrel=1
pkgdesc="Python wrapper around LuaJIT"
url="https://github.com/scoder/lupa"
license=('MIT')
arch=('x86_64')
depends=('python' 'luajit')
makedepends=('cython' 'python-setuptools')
provides=('python-lupa')
conflicts=('python-lupa')
source=("https://pypi.python.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e1d94ac2a630d271027dac2c21d1428771d9ea9d4d88f15f20a7781340f02a4e')


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build --with-cython
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
