# Maintainer: peeweep <peeweep at 0x0 dot ee>
# Contributor: Alexander Bruegmann <mail at abruegmann dot eu>

pkgname=sigma
pkgver=0.19.1
pkgrel=1
pkgdesc="Generic Signature Format for SIEM Systems"
arch=('any')
url="https://github.com/Neo23x0/sigma"
license=('LGPL3')
depends=('python-yaml' 'python-argparse' 'python-urllib3' 'python-pymisp')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('344fce7b04844f84dbbf793d2aaec37f49ff030a9595399e09042bac0c743d71')

prepare() {
  cd "${pkgname}-${pkgver}"/tools
}

build() {
  cd "${pkgname}-${pkgver}"/tools
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"/tools
  python setup.py install --root="${pkgdir}" --skip-build
  mv "${pkgdir}/usr/etc/" "${pkgdir}"

  # Update License
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/tools/LICENSE.LGPL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
