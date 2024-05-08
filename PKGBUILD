# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Ezekiel Bethel <mctinfoilball@gmail.com>

pkgname=unrpyc
pkgver=2.0.1.r11.g1eae493
pkgrel=1
epoch=2
pkgdesc="A ren'py script decompiler"
arch=("any")
url="https://github.com/CensoredUsername/unrpyc"
license=('MIT')
depends=("python")
makedepends=("python-setuptools")
source=("git+https://github.com/CensoredUsername/unrpyc.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/unrpyc"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
