# Maintainer: Beat Jäckle <beat at git dot jdmweb2 dot ch>

pkgname=tigerjython
pkgver=2.40
pkgrel=1
pkgdesc='TigerJython IDE'
arch=(x86_64)
url='https://www.tigerjython.ch/'
license=('BSD-3-Clause')
depends=('java-runtime>=2')
source=("https://git.jdmweb2.ch/beat/tigerjython_pkg/archive/v${pkgver}.tar.gz")
b2sums=('34225345329beffbb00f38d1a9c71f9efa369d750cbafebf48ff636071cf7195a707dab5fa88289f7215cbd6726d1859540035a3e693727f085bc7f5bbfcf35f')
_install_path=/usr/share

build() {
    sed -i "s|/opt/${pkgname}|${_install_path}/${pkgname}|g" "${srcdir}/tigerjython_pkg/tigerjython.desktop"
    sed -i "s|/opt/${pkgname}|${_install_path}/${pkgname}|g" "${srcdir}/tigerjython_pkg/tigerjython"
}

package() {
    install -Ddm755 "${pkgdir}/${_install_path}/${pkgname}/Lib"
    install -Ddm755 "${pkgdir}/${_install_path}/${pkgname}/TestSamples"
    install -Ddm755 "${pkgdir}/usr/share/man/man1/"
    install -Dm644 "${srcdir}/tigerjython_pkg/tigerjython2.jar" "${pkgdir}/${_install_path}/${pkgname}/."
    install -Dm644 "${srcdir}/tigerjython_pkg/Lib/"* "${pkgdir}/${_install_path}/${pkgname}/Lib/."
    install -Dm644 "${srcdir}/tigerjython_pkg/TestSamples/"* "${pkgdir}/${_install_path}/${pkgname}/TestSamples/."

    install -Dm644 "${srcdir}/tigerjython_pkg/man/tigerjython.1.gz" "${pkgdir}/usr/share/man/man1/"

    install -Dm755 "${srcdir}/tigerjython_pkg/tigerjython" "${pkgdir}/usr/bin/tigerjython"
    install -Dm755 "${srcdir}/tigerjython_pkg/tigerjython.desktop" "${pkgdir}/usr/share/applications/tigerjython.desktop"
    install -Dm755 "${srcdir}/tigerjython_pkg/tigerjython.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tigerjython.svg"
}
