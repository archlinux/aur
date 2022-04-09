# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Ezekiel Bethel <mctinfoilball@gmail.com>

pkgname=unrpyc
pkgver=1.1.8
pkgrel=1
epoch=1
pkgdesc="A ren'py script decompiler"
arch=("any")
url="https://github.com/CensoredUsername/unrpyc"
license=('MIT')
depends=("python2")
makedepends=("python2-setuptools")
source=("https://github.com/CensoredUsername/unrpyc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab2e2fb2a38ee5ad465dd7a7f7dd749cef52a3a24ee5a8b4a27c54754921bb4a')

prepare () {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "/scripts=/s/]/, 'deobfuscate.py']/" setup.py
}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  
  install -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
  mv "${pkgdir}/usr/bin/unrpyc.py" "${pkgdir}/usr/bin/unrpyc"
}
