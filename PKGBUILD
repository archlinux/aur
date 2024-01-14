# Maintainer: Beat Jäckle <beat at git dot jdmweb2 dot ch>

pkgname=tigerjython
pkgver=2.39
pkgrel=1
pkgdesc='TigerJython IDE'
arch=(x86_64)
url='https://www.tigerjython.ch/'
license=('custom')
depends=('java-runtime>=2')
source=("https://git.jdmweb2.ch/beat/tigerjython_pkg/raw/tag/V${pkgver}/TigerJython.tar.gz")
b2sums=('f8b4662be2363833cfc064c99bdc7f6e7789fc22648fff32a5d18ca567ab6254a2e4c6bd7cfa6e0ccfb965b1d4385badcc00a5ae8eb9811c8eabc2c1d28397cd')
_install_path=/usr/share

build() {
    sed -i "s|/opt/${pkgname}|${_install_path}/${pkgname}|g" TigerJython/tigerjython.desktop
    sed -i "s|/opt/${pkgname}|${_install_path}/${pkgname}|g" TigerJython/tigerjython
}

package() {
    install -Ddm755 "${pkgdir}/${_install_path}/${pkgname}/Lib"
    install -Ddm755 "${pkgdir}/${_install_path}/${pkgname}/TestSamples"
    install -Ddm755 "${pkgdir}/usr/share/man/man1/"

    install -Dm644 "${srcdir}/TigerJython/tigerjython2.jar" "${pkgdir}/${_install_path}/${pkgname}/."
    install -Dm644 "${srcdir}/TigerJython/Lib/"* "${pkgdir}/${_install_path}/${pkgname}/Lib/."
    install -Dm644 "${srcdir}/TigerJython/TestSamples/"* "${pkgdir}/${_install_path}/${pkgname}/TestSamples/."

    install -Dm644 "${srcdir}/TigerJython/man/tigerjython.1.gz" "${pkgdir}/usr/share/man/man1/"

    install -Dm755 "${srcdir}/TigerJython/tigerjython" "${pkgdir}/usr/bin/tigerjython"
    install -Dm755 "${srcdir}/TigerJython/tigerjython.desktop" "${pkgdir}/usr/share/applications/tigerjython.desktop"
    install -Dm755 "${srcdir}/TigerJython/tigerjython.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tigerjython.svg"
}
