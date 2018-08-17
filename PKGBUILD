# Maintainer: RemiliaForever <remilia AT koumakan DOT cc>

pkgname=xmind-zen
pkgver=201807162014
pkgrel=1
pkgdesc="XMind - The most popular mind mapping software"
arch=('x86_64')
url="http://www.xmind.net"
license=('EPL' 'LGPL')
depends=('gtk2' 'alsa-lib' 'gconf' 'nss' 'libxss' 'libxtst' 'libappindicator-gtk2' 'libnotify')
conflicts=('xmind')
source=("https://www.xmind.net/xmind/downloads/XMind-ZEN-for-Linux-64bit.deb"
'xmind.xml')
sha512sums=('61aa2f1b92df426f80b1f836cdb4088f3d63dc13ac858098a9b6203a2f725ae8ccf108b74ebc33992bb4c1bf59a0413b51b50e243a4f7432df81735142f75334'
'SKIP')

prepare() {
    tar -Jxvf data.tar.xz
}

package() {
    cp -r ${srcdir}/opt ${pkgdir}/opt
    cp -r ${srcdir}/usr ${pkgdir}/usr

    mkdir -p ${pkgdir}/usr/share/mime/packages
    install ${srcdir}/xmind.xml ${pkgdir}/usr/share/mime/packages/
    sed -i "s|MimeType=|MimeType=application/xmind;|" ${pkgdir}/usr/share/applications/XMind.desktop
    mkdir -p ${pkgdir}/usr/bin
    ln -s "/opt/XMind ZEN/XMind" "${pkgdir}/usr/bin/XMind"
}
