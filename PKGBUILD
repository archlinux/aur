#Maintainer: h0cheung <unknow>
#Maintainer: WhiredPlanck <unknow>

pkgbase=yozo-office-2019
pkgname=('yozo-office-2019' 'yozo-office-2019-templates' 'yozo-office-2019-fonts')
_pkgver=8.0.1331.101ZH.S1
pkgver=8.0.1331.101ZH.S1
pkgrel=3
pkgdesc="Yozo Office 2019 - An M$ Office Compatible Office Suit"
url="https://www.yozosoft.com/product-officelinux.html"
options=('!strip')
license=("custom")
arch=('x86_64') 
provides=('yozo-office')
conflicts=('yozo-office')
source_x86_64=("http://www.yozosoft.com/portal-download/fileManager/PRODUCT/yozo-office_${pkgver}_amd64.deb")
md5sums_x86_64=('cf22531071e607019c02a1a046f70e5c')

prepare() {
    cd "${srcdir}"
    tar -xvf data.tar.xz
}

package_yozo-office-2019() {
    depends=('jre8-openjdk-headless' 'libxtst' 'libxt')
    optdepends=('ttf-ms-fonts: Arial, Times, Courier etc.'
    			'ttf-ms-win10-zh_cn: SimSun, SimHei, MSYH, Tahoma etc.')
    install=${pkgname}.install
    cd "${srcdir}"
    cp -r usr "${pkgdir}"
    cp -r opt "${pkgdir}"
    cp -r etc "${pkgdir}"
    rm -rf $pkgdir/etc/xdg
    rm -rf $pkgdir/etc/skel
    rm -rf $pkgdir/opt/Yozosoft/Yozo_Office/uninstall
    rm -rf $pkgdir/opt/Yozosoft/Yozo_Office/Templates
    rm -rf $pkgdir/usr/lib64
    rm -rf $pkgdir/usr/share/mime
    rm -rf $pkgdir/usr/share/fonts/truetype/yozo
    rm -rf $pkgdir/usr/share/applications/yozo-uninstall.desktop

    rm -rf $pkgdir/opt/Yozosoft/Yozo_Office/Jre/bin
    ln -sf /usr/lib/jvm/java-8-openjdk/jre/bin $pkgdir/opt/Yozosoft/Yozo_Office/Jre/bin
    cd $pkgdir/opt/Yozosoft/Yozo_Office/Jre/lib
    mv ext ../
    rm -rf *
    for i in /usr/lib/jvm/java-8-openjdk/jre/lib/*; do
        ln -sf $i
    done
    rm ext
    mv ../ext .
    
    chmod 755 $pkgdir/usr/lib
    chmod 755 $pkgdir/usr
    chmod 755 $pkgdir/usr/bin

    targetP="${pkgdir}/opt/Yozosoft/Yozo_Office"
    unpackP="${targetP}/Jre/bin/unpack200"
    libP="${targetP}/Jre/lib"
}

package_yozo-office-2019-fonts() {
    pkgdesc="Fonts provided by Yozo Office 2019"
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/fonts/truetype/yozo"
    cp -r usr/share/fonts/truetype/yozo/* "${pkgdir}/usr/share/fonts/truetype/yozo"
    targetP="${pkgdir}/usr/share/fonts/truetype/yozo"
}

package_yozo-office-2019-templates() {
    pkgdesc="Templates files provided by Yozo Office 2019"
    cd "${srcdir}"
    install -d "${pkgdir}/opt/Yozosoft/Yozo_Office/Templates"
    cp -r opt/Yozosoft/Yozo_Office/Templates/* "${pkgdir}/opt/Yozosoft/Yozo_Office/Templates"
    
#    for i in etc/skel/*; do
#        new="$(echo $i|iconv -f utf8 -t latin1|iconv -f gbk)"
#        echo $new
#        echo -n 'Sure?'
#        read -q ans && mv -i $i $new
#        echo
#    done
    install -d "${pkgdir}/etc/skel/模板"
    cp -r etc/skel/*/* "${pkgdir}/etc/skel/模板"
    targetP="${pkgdir}/opt/Yozosoft/Yozo_Office/Templates"
}
