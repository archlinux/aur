# Maintainer: Marc Mettke <mettke@itmettke.de>

pkgname=jetbrains-mps
_pkgname=mps
_pkgver=2021.3
pkgver=${_pkgver}
pkgrel=1
pkgdesc="JetBrains Meta Programming System"
arch=('any')
url="http://www.jetbrains.com/mps/index.html"
license=('custom: MPS license agreement')
depends=('java-environment' 'libxslt' 'gtk2' 'libglvnd' 'libxtst' 'alsa-lib')
optdepends=('python: support for scripts like restart.py'
                        'ffmpeg0.10: Multimedia plugin')

source=("https://download.jetbrains.com/mps/${_pkgver}/MPS-${pkgver}.tar.gz"
                "${pkgname}.desktop")
sha256sums=('e9aeb62f0d667dd285f808e3ba308f572797dbf11d51e9aa06cf49481bee857f'
            'b948bf480e88f47776374dadcdac3da1890b0825e858ec5170c7aba6b8b9218f')

build() {
    cd "${srcdir}"
    echo "#!/bin/sh" > mps
    echo "JDK_HOME=/usr/lib/jvm/java-8-jdk /opt/${pkgname}/bin/mps.sh" >> mps
}

package() {
    mkdir -p "${pkgdir}/opt/"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

    mv "${srcdir}/MPS ${_pkgver}" "${pkgdir}/opt/${pkgname}"
    install -Dm 755 "${srcdir}/mps" "${pkgdir}/usr/bin/mps"
    install -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    ln -s "/opt/${pkgname}/license/mps_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
