# Maintainer: Matteo De Carlo <matteo dot dek at gmail dot com>

_ver=3.4.9
_ver_year=23
_ver_month=10
_ver_day=23

_rel_year=23
_rel_month=11

_ver_date="${_ver_year}${_ver_month}${_ver_day}"
_tarname="XPPenLinux${_ver}-${_ver_date}"

pkgname=xp-pen-tablet-systemlibs
conflicts=(xp-pen-tablet)
replaces=(xp-pen-tablet)
pkgver="${_ver}.${_ver_date}"
pkgrel=1
epoch=0
pkgdesc="XP-Pen (Official) Linux utility (New UI driver)"
arch=('x86_64')
url='https://www.xp-pen.com/download/index.html'
depends=('icu' 'qt5-base' 'qt5-x11extras')
# license=('/usr/lib/pentablet/doc/EULA')
source=("https://download01.xp-pen.com/file/20${_rel_year}/${_rel_month}/${_tarname}.tar.gz"
	"PenTablet.sh")
#install="${pkgname}.install"

sha512sums=('3732abdb444ae6ee0ff585b8fadb750761f194936054c392a3cf0e93f59468acedff79e864f6e751aac2b398e0ba6d951b55048ffe11bcb68c5b690062adf441'
            'e58efdc2cbafa024fc63a4a4740b2f1ad185f78fe78c740f0a10aac894603dd8cbb4b9d64cc0306525ea9d0bfd5661f02ea662316ef9acb494b91f7a8325551c')

build() {
        cd $srcdir
        tar -axf "${_tarname}.tar.gz" -C $srcdir --strip-components=2
}

package() {
        cd $srcdir

        # udev
        install -D "${srcdir}/lib/udev/rules.d/10-xp-pen.rules" -t "${pkgdir}/usr/lib/udev/rules.d/" -m644

        # usr/lib
        install -m666 -D "${srcdir}/usr/lib/pentablet/conf/xppen/"* -t "${pkgdir}/usr/lib/pentablet/conf/xppen/"
        install -m644 -D "${srcdir}/usr/lib/pentablet/doc/"* -t "${pkgdir}/usr/lib/pentablet/doc/"
        #install -m755 -D "${srcdir}/usr/lib/pentablet/lib/"* -t "${pkgdir}/usr/lib/pentablet/lib/"
        install -m755 -D "${srcdir}/usr/lib/pentablet/platforms/"* -t "${pkgdir}/usr/lib/pentablet/platforms/"
        install -m755 -D "${srcdir}/usr/lib/pentablet/"{PenTablet,PenTablet.sh} -t "${pkgdir}/usr/lib/pentablet/"
        install -m644 -D "${srcdir}/usr/lib/pentablet/resource.rcc" -t "${pkgdir}/usr/lib/pentablet/"
        # usr/share
        install -m644 -D "${srcdir}/usr/share/applications/xppentablet.desktop" "${pkgdir}/usr/share/applications/xppentablet.desktop"
        install -m644 -D "${srcdir}/usr/share/icons/hicolor/256x256/apps/xppentablet.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/xppentablet.png"

        # autostart
#         install -m644 -D "${srcdir}/etc/xdg/autostart/xppentablet.desktop" -t "${pkgdir}/etc/xdg/autostart"

}
