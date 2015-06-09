# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname=tvenlinux-desktop
pkgver=20140601
pkgrel=1
pkgdesc="Simple bash script to watch and record TV on GNU/Linux/BSD without capture card/tuner. (TV in Spain, Peru, Chile, Cuba, Venezuela, Bolivia and Argentina)"
url="http://www.tvenlinux.com/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('mplayer' 'rtmpdump')
optdepends=('zenity: for GTK users' 'kdialog: for QT users' 'curl: for view EPG (Electronic Program Guide)')
source=("http://www.tvenlinux.com/TVenLinux.sh" "http://www.tvenlinux.com/busi_tv.png")
md5sums=('a8f1c8d9d87f84e29bcca2de1656a3fd'
         '57fe139851d8227320dc2b78a9390dd6')

_pkgname="TVenLinux"

_pkgname_desktop="#!/usr/bin/env xdg-open
[Desktop Entry]
Name=TVenLinux
Exec=TVenLinux
Icon=TVenLinux
Type=Application
Comment=Script to view more than 160 channels in Spanish TDT.
Comment[es]=Script para ver más de 160 canales de TDT en Español.
Terminal=false
Categories=GNOME;AudioVideo;P2P;Video;TV;GTK;
MimeType=x-scheme-handler/sop;"

pkgver() {
    cd "${srcdir}"
     cat TVenLinux.sh | grep -e 'V_script=' | sed -e 's/V_script=//;s/"//g;s/;//;s/\///g;s/^\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)/\5\6\7\8\3\4\1\2/'
}

build() {
    cd "${srcdir}" 
    mv busi_tv.png ${_pkgname}.png
    echo -e "${_pkgname_desktop}" | tee ${_pkgname}.desktop    
}

package() {
    cd "${srcdir}"
    install -d ${pkgdir}/usr/share/applications
    install -d ${pkgdir}/usr/share/pixmaps
    install -d ${pkgdir}/usr/bin
    install -m 755 ${_pkgname}.sh  ${pkgdir}/usr/bin/${_pkgname}
    install -m 644 ${_pkgname}.desktop  ${pkgdir}/usr/share/applications
    install -m 644 ${_pkgname}.png  ${pkgdir}/usr/share/pixmaps
}
