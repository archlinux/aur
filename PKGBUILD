# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Ezekiel Bethel <mctinfoilball@gmail.com>

pkgname=unrpyc
pkgver=2.0.4
pkgrel=2
epoch=2
pkgdesc="A ren'py script decompiler"
arch=("any")
url="https://github.com/CensoredUsername/unrpyc"
license=('MIT')
depends=("python")
makedepends=("python-setuptools")
source=("git+https://github.com/CensoredUsername/unrpyc.git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CensoredUsername/unrpyc/archive/refs/tags/v${pkgver}.zip")
sha256sums=('df7446d89f68a9a94a62378248da875e9e75e983bf81de53d92b2c19f359673e')

prepare () {
    cd "${srcdir}/${pkgname}"
    sed -i "/scripts=/s/]/, 'deobfuscate.py']/" setup.py
}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  
  install -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}"
  mv "${pkgdir}/usr/bin/unrpyc.py" "${pkgdir}/usr/bin/unrpyc"
}
