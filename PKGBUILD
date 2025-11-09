# Maintainer: Daniel Plaza <daniel.plaza.espi at gmail dot com>

pkgname=mcuxpresso-config-tools
pkgver=25.09
pkgrel=1
epoch=
pkgdesc="Integrated suite of configuration tools for NXP's microcontrollers. From BIN package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/products/software-and-tools/run-time-software/mcuxpresso-software-and-tools/mcuxpresso-config-tools:MCUXpresso-Config-Tools"
license=('custom:"NXP"')
depends=('java-environment' 'libxslt' 'libxtst' 'gcc-libs-multilib' 'gtk2' 'alsa-lib' 'libnet')
source=("file://mcuxpresso-config-tools-${pkgver}-1_amd64.deb.bin" "LICENSE" "${pkgname}.install")
sha256sums=('3790a41271fc349a87ee4b68ac6cc246dca078a2af946e83200bb3aeea84980e'
            'aa4a26cafb61cd6dc848df5f7091f85c480c948c5e5f1c20800da4667e5388ea'
            '6435144e9b28ec594ebea3e598e01e23a4d41c3787a67de68dafedcf71bc18ed')

options=('!strip')

prepare() {
    chmod +x mcuxpresso-config-tools-${pkgver}-1_amd64.deb.bin
    ./mcuxpresso-config-tools-${pkgver}-1_amd64.deb.bin --noexec --keep --nox11 --target ${srcdir}
    rm mcuxpresso-config-tools-${pkgver}-1_amd64.deb.bin
    cd ${srcdir}/
    mkdir -p mcuxpresso-config-tools
    bsdtar -x -f mcuxpresso-config-tools-${pkgver}-1_amd64.deb -C mcuxpresso-config-tools
    rm mcuxpresso-config-tools-${pkgver}-1_amd64.deb
    bsdtar -x -f mcuxpresso-config-tools/data.tar.gz -C mcuxpresso-config-tools
    rm mcuxpresso-config-tools/data.tar.gz
}


package() {
        cp -r ${srcdir}/mcuxpresso-config-tools/usr ${pkgdir}/;
        cp -r ${srcdir}/mcuxpresso-config-tools/opt ${pkgdir}/;
        install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;        
}
