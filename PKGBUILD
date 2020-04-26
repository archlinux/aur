# Maintainer: j605

_name="julia"
pkgname="python-${_name}"
pkgver=0.5.3
pkgrel=1
pkgdesc="python interface to julia"
arch=('any')
url="https://github.com/JuliaPy/pyjulia"
license=('MIT')
depends=('python')
checkdepends=(python-tox)
makedepends=('python-pypandoc' 'pandoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JuliaPy/pyjulia/archive/v$pkgver.tar.gz")
sha256sums=('a02e55501fd7bc7583eb7f5b5efaf045fcb52e418ee9d5149be15c69505dbda8')

build() {
  cd "pyjulia-$pkgver"
  python setup.py build
}

check() {
  cd "pyjulia-$pkgver"
  tox
}

package() {
  cd "pyjulia-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build

  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
