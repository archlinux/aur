# Maintainer: Daniel Plaza <daniel.plaza.espi at gmail dot com>

pkgname=mcuxpresso-config-tools
pkgver=12.1
pkgrel=1
epoch=
pkgdesc="Integrated suite of configuration tools for NXP's microcontrollers. From BIN package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/products/software-and-tools/run-time-software/mcuxpresso-software-and-tools/mcuxpresso-config-tools:MCUXpresso-Config-Tools"
license=('custom:"NXP"')
depends=('java-environment' 'libxslt' 'libxtst' 'gcc-libs-multilib' 'gtk2' 'alsa-lib' 'libnet')
source=("file://mcuxpresso-config-tools-v13-1_amd64.deb.bin" "LICENSE" "${pkgname}.install")
sha256sums=('9cd4273a613e91c527b71f33b2f74e8301db8dda97be12b8c356b1faffef8cb9'
            '4b91471aac6b1deb57011893b9c024043def99ca611729d52b36f8c7f988c983'
            '6435144e9b28ec594ebea3e598e01e23a4d41c3787a67de68dafedcf71bc18ed')

options=('!strip')

prepare() {
    chmod +x mcuxpresso-config-tools-v13-1_amd64.deb.bin
    ./mcuxpresso-config-tools-v13-1_amd64.deb.bin --noexec --keep --nox11 --target ${srcdir}
    rm mcuxpresso-config-tools-v13-1_amd64.deb.bin
    cd ${srcdir}/
    mkdir -p mcuxpresso-config-tools
    bsdtar -x -f mcuxpresso-config-tools-v13-1_amd64.deb -C mcuxpresso-config-tools
    rm mcuxpresso-config-tools-v13-1_amd64.deb
    bsdtar -x -f mcuxpresso-config-tools/data.tar.gz -C mcuxpresso-config-tools
    rm mcuxpresso-config-tools/data.tar.gz
}


package() {
        cp -r ${srcdir}/mcuxpresso-config-tools/usr ${pkgdir}/;
        cp -r ${srcdir}/mcuxpresso-config-tools/opt ${pkgdir}/;
        install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;        
}
