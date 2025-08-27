# Maintainer: adogecheems <adogecheems@outlook.com>

pkgname=unrpyc1
pkgver=1.3.2
pkgrel=1
pkgdesc="A ren'py script decompiler"
arch=("any")
url="https://github.com/CensoredUsername/unrpyc"
license=('MIT')
depends=("python2")
makedepends=("python2-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a038fe4f5bc0dbc346f4e2ee9c656a363defdb0d5259df65b66b2520fe823e9a')

prepare () {
    cd "${srcdir}/unrpyc-${pkgver}"
    mv deobfuscate.py deobfuscate1.py
    sed -i "/scripts=/s/]/, 'deobfuscate1.py']/" setup.py
    sed -i "/import deobfuscate/import deobfuscate1 as deobfuscate/" unrpyc.py
}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m644 "${srcdir}/unrpyc-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/unrpyc-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
  mv "${pkgdir}/usr/bin/unrpyc.py" "${pkgdir}/usr/bin/unrpyc1"
}
