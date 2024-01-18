# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Ezekiel Bethel <mctinfoilball@gmail.com>

pkgname=unrpyc
pkgver=1.1.5.r63.g105b6f6
pkgrel=1
epoch=2
pkgdesc="A ren'py script decompiler (madeddy fork)"
arch=("any")
url="https://github.com/madeddy/unrpyc/tree/py3_v1.2.0_dev"
license=('MIT')
depends=("python")
makedepends=("python-setuptools")
source=("git+https://github.com/madeddy/unrpyc.git#branch=py3_v1.2.0_dev")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/unrpyc"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
    cd "${srcdir}/${pkgname}"
    sed -i "/scripts=/s/]/, 'deobfuscate.py', '_unrpyc_ver.py']/" setup.py
}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  
  install -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}"
  mv "${pkgdir}/usr/bin/unrpyc.py" "${pkgdir}/usr/bin/unrpyc"
}
