# Maintainer: adogecheems <adogecheems at outlook dot com>

pkgname=unrpyc1
pkgver=1.3.2
pkgrel=2
pkgdesc="A ren'py script decompiler"
arch=("any")
url="https://github.com/CensoredUsername/unrpyc"
license=('MIT')
depends=("python2")
makedepends=("python2-setuptools")
source=("unrpyc-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare () {
    cd "${srcdir}/unrpyc-$pkgver"
    mv deobfuscate.py deobfuscate1.py
    sed -i "/scripts=/s/]/, 'deobfuscate1.py']/" setup.py
    sed -i "/py_modules=/s/\.deobfuscate/\.deobfuscate1/" setup.py
    sed -i 's/^\s*import deobfuscate\s*$/import deobfuscate1 as deobfuscate/' unrpyc.py
}

package() {
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"

    install -m644 "${srcdir}/unrpyc-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${srcdir}/unrpyc-$pkgver"
    python2 setup.py install --root="${pkgdir}"
    mv "${pkgdir}/usr/bin/unrpyc.py" "${pkgdir}/usr/bin/unrpyc1"
}
