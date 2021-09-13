# Maintainer: ssfdust <ssfdust@gmail.com>
# Contributor: sukanka <su975853527@gmail.com>
pkgname=aliyunpan-liupan1890
url="https://github.com/liupan1890/aliyunpan"
pkgrel=2
pkgver=2.8.30
pkgdesc="阿里云盘小白羊版 阿里云盘PC版"
arch=("x86_64")
license=("None")
depends=('electron' 'aria2')
optdepends=('mpv: media preview support')
source=("https://store.deepinos.org.cn/store/network/liupan1890.github.aliyunpan/liupan1890.github.aliyunpan_${pkgver}_all.deb"    # https://wwe.lanzoui.com/ivPlAtdn52h
        'aliyunpan-liupan1890.svg'
        'aliyunpan-liupan1890.desktop')
md5sums=('7638f785e64eb7995d2a56d5e2033742'
         'cfea225b67778e82b289f99e57b28c6f'
         '79cf6842090d1b323ccb3582928c8f56')
options=(!strip)

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
}

package(){
    mkdir -p ${pkgdir}/opt/aliyunpan-liupan1890/
    cp ${srcdir}/opt/apps/liupan1890.github.aliyunpan/files/electron/resources/{app.asar,app.ico,AppIcon.icns,app.png,aria2.conf} ${pkgdir}/opt/aliyunpan-liupan1890/
    chmod 666 ${pkgdir}/opt/aliyunpan-liupan1890/app.asar

    ln -s /usr/bin/aria2c ${pkgdir}/opt/aliyunpan-liupan1890/

    mkdir -p ${pkgdir}/usr/bin
    echo '''#!/usr/bin/bash
electron /opt/aliyunpan-liupan1890/app.asar "$@"
''' > ${pkgdir}/usr/bin/${pkgname}
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

    install -Dm644 ${srcdir}/aliyunpan-liupan1890.desktop -t ${pkgdir}/usr/share/applications/
    install -Dm644 ${srcdir}/aliyunpan-liupan1890.svg -t ${pkgdir}/usr/share/icons/
}
