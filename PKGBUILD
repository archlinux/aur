#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('tradermaster')
pkgver=3.0
pkgrel=0
pkgdesc="超强行情分析软件"
provides=("tradermaster")
url='http://jiaoyixia.com/'
arch=('x86_64')
depends=('glfw-x11'  'glew'  'fontconfig'  'freetype2'  'libzip' 'libpng' 'curl' 'openssl' 'libxcb' 'glib2')
source=("${pkgname}.deb::https://cdn.jin10.com/linuxclient/TraderMaster_20_04.deb")
sha512sums=('9846035301fd6fe7298ee26686c74fefe5ebe6fc15b967ab26ee3cd98c0645f4ea3443411eb324f2a0df302e758548a150fb06755e634a631fb5fdf363827d39')

package(){
        cd ${srcdir}
        tar -xJvf data.tar.xz -C "${pkgdir}"
        
        # bin
        mkdir -p "${pkgdir}"/opt/TraderMaster
        mv "${pkgdir}"/usr/bin/TraderMaster/TraderMaster "${pkgdir}"/opt/TraderMaster/TraderMaster
        mv "${pkgdir}"/usr/bin/TraderMaster/run.sh "${pkgdir}"/opt/TraderMaster/run.sh
        
        
        # libs
        mkdir -p "${pkgdir}"/usr/lib/TraderMaster
        mv "${pkgdir}"/usr/bin/TraderMaster/libGLEW.so.2.1 "${pkgdir}"/usr/lib/TraderMaster/libGLEW.so.2.1
        mv "${pkgdir}"/usr/bin/TraderMaster/libfmod.so.6 "${pkgdir}"/usr/lib/TraderMaster/libfmod.so.6
        sed -i 's|/usr/bin/TraderMaster|/usr/lib/TraderMaster|g' "${pkgdir}"/opt/TraderMaster/run.sh
       sed -i 's|/usr/lib/TraderMaster/TraderMaster|/opt/TraderMaster/TraderMaster|g' "${pkgdir}"/opt/TraderMaster/run.sh
       
        # resource
        mkdir -p "${pkgdir}"/opt/TraderMaster/Resources
        mv "${pkgdir}"/usr/bin/TraderMaster/Resources/* "${pkgdir}"/opt/TraderMaster/Resources/
       
       
       # desktop
       sed -i 's|/usr/bin/TraderMaster|/opt/TraderMaster|g' "${pkgdir}"/usr/share/applications/TraderMaster.desktop
       
        # chmod
        chmod -R 0755 "${pkgdir}"/opt
        chmod -R 0755 "${pkgdir}"/usr/
        
       # remove files
       rm -rf "${pkgdir}/usr/bin"

}
