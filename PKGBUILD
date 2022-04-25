# Maintainer: wuxxin <wuxxin@gmail.com>
# Based on solo-python; original contributors:
# Contributor: mutantmonkey <aur@mutantmonkey.mx>

pkgname=solo1
pkgver=0.1.1
pkgrel=1
pkgdesc="Python tool and library for SoloKeys Solo 1"
arch=('any')
url="https://github.com/solokeys/solo1-cli"
license=('Apache' 'MIT')
depends=('python' 'python-click>=7.1' 'python-cryptography' 'python-ecdsa'
         'python-fido2' 'python-intelhex' 'python-pyserial' 'python-pyusb'
         'python-requests')
makedepends=('python-pip' 'python-flit')
source=("${pkgname}-cli-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('377f0c244ee0efc741f18b3370cc0e5dcaff852db90102eeb258201128643c84')


build() {
  cd "${srcdir}/${pkgname}-cli-${pkgver}"
  python -m flit build --format wheel
}

package() {
  cd "${srcdir}/${pkgname}-cli-${pkgver}"
  install -Dm 644 LICENSE-MIT \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  pip install -I --no-warn-script-location --isolated --no-deps --compile \
    --root="${pkgdir}" dist/${pkgname/-/_}-${pkgver}-py3-none-any.whl
}
