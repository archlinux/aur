# Maintainer: giver <giverc139@gmail.com>

_pyname=cxxheaderparser
pkgname=python-${_pyname}
pkgver=1.6.1
pkgrel=1
pkgdesc="Parse C++ header files and generate a data structure representing the class"
arch=('any')
url="https://github.com/robotpy/cxxheaderparser"
license=('BSD-3-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$pkgname-$pkgver::git+$url#tag=$pkgver")
sha256sums=('3da102ae0371fbf6f513e8e81a57de2156ca529d15efbc297637fe5e562dc007')
b2sums=('025d7c6c20ef9966ae0bbff0872e6455564975f04d9a236a3fe2b2a02cd44dc58aab4c7d038d4c0e48520dd2a632313db7f9c5228208925565b24efa20c2a0c6')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
