# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=xunlei-bin
pkgver=1.0.0.2
pkgrel=1
pkgdesc="Xunlei download, 迅雷"
arch=("x86_64" "aarch64")
url="https://www.xunlei.com/"
license=("custom")
depends=('dbus-glib'  'libxtst' 'gtk2' 'alsa-lib' 'nss' 'libxss' 'rsync')
provides=('xunlei')
source=("license.html"
"xunlei"
)
source_x86_64=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.xunlei.download/com.xunlei.download_${pkgver}_amd64.deb")
source_aarch64=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.xunlei.download/com.xunlei.download_${pkgver}_arm64.deb")

sha512sums=('3b0056713d046b01b01de9679a605bbf810c1f6f8c022b2200e14ef864db0583c46b3b9ccc9a0246bb3d70d3fad3415c33804cac5486d1cffb2d3081566d17bd'
            'c7de252b7c2abfe26963c1202b1b394057ac68a98c31eebc39e9d21087f53ee15c8aeb30e09138748090ec8e2388b6038c4560e484fb97b119dbdcc6486b2a6a')
sha512sums_x86_64=('d65824b64f65af22037e62be14abf0363e552909cc11fef3c54e99c30dc8acd4340185445092b3ab37d226923a06d459037b83fe2c4c6a1b429f7bc31315e52b')
sha512sums_aarch64=('4d05277ef5510d00c6a450fce6b224fcd05231a20689138041b250aec9f80f8c8ee3ff248d7554aa1086e32dcd99b980fc0d9f6543c647a2d4aa2bd51c205764')

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"

}

package(){
    cd ${srcdir}
    mkdir -p ${pkgdir}/opt/xunlei
    mv opt/apps/com.xunlei.download/files/* ${pkgdir}/opt/xunlei
    
    install -D opt/apps/com.xunlei.download/entries/applications/com.xunlei.download.desktop \
        ${pkgdir}/usr/share/applications/com.xunlei.download.desktop
    
    mkdir -p ${pkgdir}/usr/share/
    mv opt/apps/com.xunlei.download/entries/icons  ${pkgdir}/usr/share/icons
    mv  ${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.thunder.download.svg \
        ${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.xunlei.download.svg
        
    install -Dm644 license.html ${pkgdir}/usr/share/licenses/xunlei/license.html
    
    sed -i '4c Exec=xunlei %U' ${pkgdir}/usr/share/applications/com.xunlei.download.desktop
    sed -i '5c Icon=com.xunlei.download' ${pkgdir}/usr/share/applications/com.xunlei.download.desktop
    sed -i '7c Categories=Network' ${pkgdir}/usr/share/applications/com.xunlei.download.desktop
    
    
    install -Dm755 xunlei ${pkgdir}/opt/xunlei/start.sh
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/xunlei/start.sh ${pkgdir}/usr/bin/xunlei
    
}
