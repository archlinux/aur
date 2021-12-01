# Maintainer: zhullyb < zhullyb [at] outook dot com >
# Maintainer: sukanka < su975853527 [at] gmail dot com >
pkgname=aliyunpan-liupan1890
url="https://github.com/liupan1890/aliyunpan"
pkgrel=1
pkgver=2.11.29
pkgdesc="阿里云盘小白羊版 阿里云盘PC版"
arch=("x86_64")
license=("None")
depends=('electron12' 'aria2')
optdepends=('mpv: media preview support')
source=(
        "https://store.deepinos.org.cn//store/network/liupan1890.github.aliyunpan/liupan1890.github.aliyunpan_${pkgver}_all.deb"
#       "https://github.com/liupan1890/aliyunpan/releases/download/v${pkgver}/Linux.v${pkgver}.zip"
        'aliyunpan-liupan1890.svg'
        'aliyunpan-liupan1890.desktop')
sha256sums=('05085e46fa2cf197d4328da372fedfe46c7180bd140913c7382fe1bf6ed8baa6'
            'd2601a3d659348395a853ff3659a664b464dd82a841c0ee51462d2446d054cf4'
            'd66ea764845bf3f7619d447aef33c78b2b06470c855941f337d2b37e6de5a347')
options=()

_electron_resources="opt/apps/liupan1890.github.aliyunpan/files/electron/resources" # From Spark Store
#_electron_resources="阿里小白羊版Linux\ v${pkgver}/electron/resources"               # From Github Release

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
}

package(){
    mkdir -p ${pkgdir}/usr/lib/aliyunpan-liupan1890/
    cp ${srcdir}/${_electron_resources}/{app.asar,app.ico,AppIcon.icns,app.png,aria2.conf} ${pkgdir}/usr/lib/aliyunpan-liupan1890/
    chmod 644 ${pkgdir}/usr/lib/aliyunpan-liupan1890/app.asar

    ln -s /usr/bin/aria2c ${pkgdir}/usr/lib/aliyunpan-liupan1890/

    mkdir -p ${pkgdir}/usr/bin
    echo '''#!/usr/bin/bash
electron12 /usr/lib/aliyunpan-liupan1890/app.asar "$@"
''' > ${pkgdir}/usr/bin/${pkgname}
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

    install -Dm644 ${srcdir}/aliyunpan-liupan1890.desktop -t ${pkgdir}/usr/share/applications/
    install -Dm644 ${srcdir}/aliyunpan-liupan1890.svg -t ${pkgdir}/usr/share/icons/
}
