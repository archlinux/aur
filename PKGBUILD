# Maintainer: Romain Bazile <gromain d0t baz at gmail dot com>

pkgname=mcuxpresso-config-tools
pkgver=7.0.1
pkgrel=1
epoch=
pkgdesc="Integrated suite of configuration tools for NXP's microcontrollers. From BIN package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/products/software-and-tools/run-time-software/mcuxpresso-software-and-tools/mcuxpresso-config-tools:MCUXpresso-Config-Tools"
license=('custom:"NXP"')
depends=('java-environment' 'libxslt' 'libxtst' 'gcc-libs-multilib' 'gtk2' 'alsa-lib' 'libnet')
source=("$pkgname.deb.bin::https://cache.nxp.com/secured/bsps/mcuxpresso-config-tools-v7.0.1-1_amd64.deb.bin?__gda__=1583741778_4f0a1178c18866aec9b7c6b80850a6f9&fileExt=.bin" "LICENSE" "${pkgname}.install")
sha256sums=('0db62837f56f773ae01a0e41b00b4e36bce3234b08a25d8d0f5110fff0bb90d2'
            'e2c42a6da340d06d39e184fdcf56dfa59c6ed60953627a2e36a0a665fd1f0f3a'
            '6435144e9b28ec594ebea3e598e01e23a4d41c3787a67de68dafedcf71bc18ed')

options=('!strip')

prepare() {
    chmod +x mcuxpresso-config-tools.deb.bin
    ./mcuxpresso-config-tools.deb.bin --noexec --keep --target ${srcdir}
    rm mcuxpresso-config-tools.deb.bin
    cd ${srcdir}/
    mkdir -p mcuxpresso-config-tools
    bsdtar -x -f mcuxpresso-config-tools-v7-1_amd64.deb -C mcuxpresso-config-tools
    rm mcuxpresso-config-tools-v7-1_amd64.deb
    bsdtar -x -f mcuxpresso-config-tools/data.tar.gz -C mcuxpresso-config-tools
    rm mcuxpresso-config-tools/data.tar.gz
}


package() {
        cp -r ${srcdir}/mcuxpresso-config-tools/usr ${pkgdir}/;
        cp -r ${srcdir}/mcuxpresso-config-tools/opt ${pkgdir}/;
        install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;
}
