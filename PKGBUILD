# Maintainer: Romain Bazile <gromain d0t baz at gmail dot com>

pkgname=mcuxpresso-config-tools
pkgver=8.0.1
pkgrel=1
epoch=
pkgdesc="Integrated suite of configuration tools for NXP's microcontrollers. From BIN package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/products/software-and-tools/run-time-software/mcuxpresso-software-and-tools/mcuxpresso-config-tools:MCUXpresso-Config-Tools"
license=('custom:"NXP"')
depends=('java-environment' 'libxslt' 'libxtst' 'gcc-libs-multilib' 'gtk2' 'alsa-lib' 'libnet')
source=("$pkgname.deb.bin::https://cache.nxp.com/secured/bsps/mcuxpresso-config-tools-v8-1_amd64.deb.bin?__gda__=1597045577_ba98084c01908bdd60d94d43c27382a5&fileExt=.bin" "LICENSE" "${pkgname}.install")
sha256sums=('24b76f8c55035b62efa4a32633b51ef929f9dafba7e4abd8bbf614d92b6bf321'
            '4890a24d8cfed2cc20efa8bed195c6eacb32ad5ec83d3b6129a88fd397602115'
            '6435144e9b28ec594ebea3e598e01e23a4d41c3787a67de68dafedcf71bc18ed')

options=('!strip')

prepare() {
    chmod +x mcuxpresso-config-tools.deb.bin
    ./mcuxpresso-config-tools.deb.bin --noexec --keep --target ${srcdir}
    rm mcuxpresso-config-tools.deb.bin
    cd ${srcdir}/
    mkdir -p mcuxpresso-config-tools
    bsdtar -x -f mcuxpresso-config-tools-v8-1_amd64.deb -C mcuxpresso-config-tools
    rm mcuxpresso-config-tools-v8-1_amd64.deb
    bsdtar -x -f mcuxpresso-config-tools/data.tar.gz -C mcuxpresso-config-tools
    rm mcuxpresso-config-tools/data.tar.gz
}


package() {
        cp -r ${srcdir}/mcuxpresso-config-tools/usr ${pkgdir}/;
        cp -r ${srcdir}/mcuxpresso-config-tools/opt ${pkgdir}/;
        install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;
}
