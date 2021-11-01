# Maintainer sakura1943 <1436700265@qq.com>

pkgname='windterm-git'
pkgver='2.1.0'
pkgrel='2.1'
pkgdesc='A Quicker and better SSH/Telnet/Serial/Shell/Sftp client for DevOps.'
arch=('x86_64')
depends=('wget')
license=('unknown')
url='https://github.com/kingToolbox/WindTerm/'
provides=('kingToolbox')
options=(!strip)
source=("${pkgname}-${pkgver}-${arch}.tar.gz::https://git.sakura1943.top/kingToolbox/WindTerm/releases/download/2.1/WindTerm_2.1.0_Linux_Portable.tar.gz")
sha512sums=('a948712add39ac5e2d4193a4049058e3d09587313ced0e0ca219da4f2b2128e517c14d071c3c617f5e4a51db4fff2cb866ec91451f25ffe64f4053fba71958cb')

package (){
	mkdir --parent "${pkgdir}"/opt
	mkdir --parent "${pkgdir}"/usr/share/icons
	mkdir --parent "${pkgdir}"/usr/share/applications
	mkdir --parent "${pkgdir}"/usr/bin
	mv ${srcdir}/* "${pkgdir}"/opt
	mv "${pkgdir}"/opt/WindTerm_2.1.0 "${pkgdir}"/opt/windterm
	wget https://git.sakura1943.top/kingToolbox/WindTerm/raw/master/images/WindTerm_icon_1024x1024.png  
	mv WindTerm_icon_1024x1024.png "${pkgdir}"/usr/share/icons/
	mv "${pkgdir}"/usr/share/icons/WindTerm_icon_1024x1024.png "${pkgdir}"/usr/share/icons/windterm.png
	
	echo '''
[Desktop Entry]
Name=WindTerm
Comment=A Quicker and better SSH/Telnet/Serial/Shell/Sftp client for DevOps.
GenericName=Connect Client
Exec=/usr/bin/windterm
Type=Application
Icon=windterm
StartupNotify=false
StartupWMClass=Code
Categories=Connect;SSH;Client;
MimeType=application/windterm;
Actions=new-empty-window;
Keywords=windterm;

[Desktop Action new-empty-window]
Name=New Empty Window
Icon=windterm
Exec=/usr/bin/windterm
''' > "${pkgdir}"/usr/share/applications/windterm.desktop
chmod -R 0700 "${pkgdir}"/opt/windterm/lib
chmod +x "${pkgdir}"/opt/windterm/WindTerm
	echo '''
#!/bin/bash -e
export XDG_RUNTIME_DIR=/opt/windterm/lib
export RUNLEVEL=3
cd /opt/windterm
./WindTerm &
''' > "${pkgdir}"/usr/bin/windterm
chmod +x "${pkgdir}"/usr/bin/windterm
}
