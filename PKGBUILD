# Maintainer: Beat Jäckle <beat at git dot jdmweb2 dot ch>

pkgname=tigerjython
pkgver=2.37
pkgrel=6
pkgdesc='TigerJython IDE'
arch=(x86_64)
url='https://www.tigerjython.ch/'
license=('custom')
depends=('java-runtime>=2')
source=("https://git.jdmweb2.ch/beat/tigerjython_pkg/raw/tag/v2.37/TigerJython.tar.gz")
b2sums=('a51f163dc58abd0100f08f65cd682ad02c6cfb7e09333a18034d4df1f25a50a41db243f18b4444b8156bfba76dbbebef6e32a3deba428f8c4000c998b01bba7c')
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
