# Maintainer: j605

_name="julia"
pkgname="python-${_name}"
pkgver=0.5.6
pkgrel=1
pkgdesc="python interface to julia"
arch=('any')
url="https://github.com/JuliaPy/pyjulia"
license=('MIT')
depends=('python')
checkdepends=(python-tox)
makedepends=('python-pypandoc' 'pandoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JuliaPy/pyjulia/archive/v$pkgver.tar.gz")
sha256sums=('ca4a1dc3df9b770dacbbecab5495cae817a5dde0ac2d3ff1db1f8e447f0e48b7')

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
