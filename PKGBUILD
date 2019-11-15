# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=solo-python
pkgver=0.0.18
pkgrel=1
pkgdesc="Tools and Python library for SoloKeys."
arch=('any')
url="https://github.com/solokeys/solo-python"
license=('Apache' 'MIT')
depends=('python' 'python-click>=7.0' 'python-cryptography' 'python-ecdsa'
         'python-fido2' 'python-intelhex' 'python-pyserial' 'python-pyusb'
         'python-requests')
makedepends=('python-pip' 'flit')
source=("https://files.pythonhosted.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('47f75a687c81e93d2d99011d2d60d2575da1297103063c5a169d0eadadbe8cfd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  flit build --format wheel
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 644 LICENSE-MIT \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  pip install -I --no-warn-script-location --isolated --no-deps --compile \
    --root="${pkgdir}" dist/${pkgname/-/_}-${pkgver}-py3-none-any.whl
}
