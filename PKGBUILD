# Maintainer: zhullyb < zhullyb [at] outook dot com >
# Maintainer: sukanka < su975853527 [at] gmail dot com >
pkgname=aliyunpan-liupan1890
url="https://github.com/liupan1890/aliyunpan"
pkgrel=1
pkgver=2.9.24
pkgdesc="阿里云盘小白羊版 阿里云盘PC版"
arch=("x86_64")
license=("None")
depends=('electron12' 'aria2')
optdepends=('mpv: media preview support')
source=("https://github.com/liupan1890/aliyunpan/releases/download/v${pkgver}/Linux.v${pkgver}.zip"
        'aliyunpan-liupan1890.svg'
        'aliyunpan-liupan1890.desktop')
md5sums=('cc1e701f3779e6b3eb157e5a678e3846'
         'cfea225b67778e82b289f99e57b28c6f'
         '79cf6842090d1b323ccb3582928c8f56')
options=(!strip)

package(){
    mkdir -p ${pkgdir}/opt/aliyunpan-liupan1890/
    cp ${srcdir}/阿里小白羊版Linux\ v${pkgver}/electron/resources/{app.asar,app.ico,AppIcon.icns,app.png,aria2.conf} ${pkgdir}/opt/aliyunpan-liupan1890/
    chmod 644 ${pkgdir}/opt/aliyunpan-liupan1890/app.asar

    ln -s /usr/bin/aria2c ${pkgdir}/opt/aliyunpan-liupan1890/

    mkdir -p ${pkgdir}/usr/bin
    echo '''#!/usr/bin/bash
electron12 /opt/aliyunpan-liupan1890/app.asar "$@"
''' > ${pkgdir}/usr/bin/${pkgname}
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

    install -Dm644 ${srcdir}/aliyunpan-liupan1890.desktop -t ${pkgdir}/usr/share/applications/
    install -Dm644 ${srcdir}/aliyunpan-liupan1890.svg -t ${pkgdir}/usr/share/icons/
}
