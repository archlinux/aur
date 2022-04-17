# Maintainer: Martin Joergensen <newsboost at gmail com>
pkgname=python-stego-lsb
_name=${pkgname#python-}
pkgver="1.3.3"
pkgrel=1
pkgdesc="Least Significant Bit Steganography for .bmp, .png, WAV sound files, and byte sequences."
arch=('any')
url="https://github.com/ragibson/Steganography"
license=('MIT')
depends=(python python-click python-pillow python-numpy)
makedepends=(python-setuptools)
provides=('stegolsb')
source=(
  "https://files.pythonhosted.org/packages/2a/11/b4779629886222381320f9ceb3a3104a598dec0f628e1dae2c2d4d402b25/stego_lsb-${pkgver}.tar.gz"
)
md5sums=('e2cfaa247f0caace30dc62f85cffcef2')

build() {
  cd "${_name//-/_}-$pkgver"
  python3 setup.py build
}

package() {
  cd "${_name//-/_}-$pkgver"
  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

