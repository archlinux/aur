# Maintainer: hendy643 <hendy643@hotmail.com>

pkgname=config-tools-for-imx
pkgver=15
pkgrel=1
epoch=
pkgdesc="Integrated suite of configuration tools for NXP's i.MX Application Processors. From BIN package distributed by NXP."
arch=('x86_64')
url="https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/config-tools-for-i-mx-applications-processors:CONFIG-TOOLS-IMX"
license=('custom:"NXP"')
depends=('java-environment' 'libxslt' 'libxtst' 'gcc-libs-multilib' 'gtk2' 'alsa-lib' 'libnet')
source=("file://config-tools-for-imx-v${pkgver}-${pkgrel}_amd64.deb.bin" "LICENSE" "${pkgname}.install")
sha256sums=('18ff438c1d188e9115919d2aa0a9fdda62a09a4907e1d14f25e8c228f66baf36'
            '41beb81990892ba157f85cd6c008f65191a763c97331ac6c8cceb18700883af5'
            'a1f53f36f04d98667717092eedc6ccb6c5a5a3ea7ad6ded79a9ac6f004f6307c')

options=('!strip')

prepare() {
    chmod +x config-tools-for-imx-v${pkgver}-${pkgrel}_amd64.deb.bin
    ./config-tools-for-imx-v${pkgver}-${pkgrel}_amd64.deb.bin --noexec --keep --nox11 --target ${srcdir}
    rm config-tools-for-imx-v${pkgver}-${pkgrel}_amd64.deb.bin
    cd "${srcdir}"/ || exit
    mkdir -p config-tools-for-imx
    bsdtar -x -f config-tools-for-imx-v${pkgver}-${pkgrel}_amd64.deb -C config-tools-for-imx
    rm config-tools-for-imx-v${pkgver}-${pkgrel}_amd64.deb
    bsdtar -x -f config-tools-for-imx/data.tar.gz -C config-tools-for-imx
    rm config-tools-for-imx/data.tar.gz
}


package() {
        cp -r "${srcdir}"/config-tools-for-imx/usr "${pkgdir}"/;
        cp -r "${srcdir}"/config-tools-for-imx/opt "${pkgdir}"/;
        install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE";        
}
