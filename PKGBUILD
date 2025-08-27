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
source=("${pkgname}.zip::${url}/archive/refs/heads/legacy.zip")
noextract=("${pkgname}.zip")
sha256sums=('SKIP')

prepare () {
   unzip -q "${srcdir}/${pkgname}.zip" -d "${srcdir}"

    cd "${srcdir}/unrpyc-legacy"
    mv deobfuscate.py deobfuscate1.py
    sed -i "/scripts=/s/]/, 'deobfuscate1.py']/" setup.py
    sed -i "/.deobfuscate/.deobfuscate1/" setup.py
    sed -i "/import deobfuscate/import deobfuscate1 as deobfuscate/" unrpyc.py
}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m644 "${srcdir}/unrpyc-legacy/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/unrpyc-legacy"
  python2 setup.py install --root="${pkgdir}"
  mv "${pkgdir}/usr/bin/unrpyc.py" "${pkgdir}/usr/bin/unrpyc1"
}
