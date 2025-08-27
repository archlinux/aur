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
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "/scripts=/s/]/, 'deobfuscate.py']/" setup.py
}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  
  install -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  mv "${pkgdir}/usr/bin/unrpyc1.py" "${pkgdir}/usr/bin/unrpyc1"
}
