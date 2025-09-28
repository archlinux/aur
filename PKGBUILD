# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Ezekiel Bethel <mctinfoilball@gmail.com>

pkgname=unrpyc
pkgver=2.0.2
pkgrel=2
epoch=2
pkgdesc="A ren'py script decompiler"
arch=("any")
url="https://github.com/CensoredUsername/unrpyc"
license=('MIT')
depends=("python")
makedepends=("python-setuptools")
source=("git+https://github.com/madeddy/unrpyc.git#branch=renpy_v8.4_code_change_fixes")
sha256sums=('SKIP')

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
