# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=solo-python
pkgver=0.0.9
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
sha256sums=('0de0105e53637c6ba8753dcc02cd504f6424c34cc77373219793b5c0d7a832c4')

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
