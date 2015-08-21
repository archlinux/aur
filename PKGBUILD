# Maintainer: Francisco Martinez <zomernifalt at gmail dot com>
pkgname=makerbot-desktop
pkgver=3.6.0
_openmeshver=3.2
_vtk5ver=5.10.1
pkgrel=1
pkgdesc="A complete, free 3D printing solution for discovering, managing, and sharing your 3D prints."
arch=('x86_64')
url="https://www.makerbot.com/desktop"
license=('GPL')
depends=('qt5-base' 'qt5-multimedia' 'qt5-webkit' 'jsoncpp' 'postgresql-libs' 'python2'
'libjpeg6' 'yajl' 'qt4' 'libmariadbclient' 'shared-mime-info' 'opencv' 'gl2ps' 'hdf5' 'tcl' 'zenity')
makedepends=('rpmextract')
options=('!strip')
install="$pkgname.install"
_fakefedorarelease=fc20
_baseurl="http://downloads.makerbot.com/makerware/yum/Fedora/20/${CARCH}"
source=(
"$_baseurl/makerware-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/Miracle-Grue-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/OpenMesh-${_openmeshver}-2.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/ToolPathViz-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/conveyor-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/conveyor-ui-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/jsonrpc-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/libdigitizer-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/libmbqtutils-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/libthing-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/libtinything-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/makerbot_driver-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/mb_pyserial-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"$_baseurl/vtk5-${_vtk5ver}-7.${_fakefedorarelease}.${CARCH}.rpm")
noextract=(
"makerware-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"Miracle-Grue-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"OpenMesh-${_openmeshver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"ToolPathViz-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"conveyor-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"conveyor-ui-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"jsonrpc-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"libdigitizer-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"libmbqtutils-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"                                                                                                                                                                 
"libthing-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"                                                                                                                                                                     
"libtinything-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"                                                                                                                                                                 
"makerbot_driver-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"
"mb_pyserial-${pkgver}-1.${_fakefedorarelease}.${CARCH}.rpm"                                                                                                                                                                  
"vtk5-${_vtk5ver}-7.${_fakefedorarelease}.${CARCH}.rpm")
md5sums=('814340a3dee0a5e43ff88a4492bb3f76'
         'f770b8b8fd047d4e047b5e5abd4df258'
         'ec54d9b4ef8c3875e903bfd2cfc36944'
         '85f593121f11d879ee64412d8b9dac8a'
         '3a74b119d021133f46bad83b6e09ea86'
         'fab07c8d7f50d5ad010e1845efa8cb15'
         '27da45afaa610532956ce7ff51a462d0'
         '6b675e5b570e7ac42638c69aa33005a9'
         '6a4ba6d0a5e5476f7927003547f0d50f'
         '3bb19ff735508b2e9089cac0f81379d6'
         'e81fea4afedb95c82d48cdb327d48410'
         '4d9c73859055f2279a02d37d4b9c358f'
         '76d1b06af8df4e9ea6d6d6ce2d22ae7b'
         'aeba99a1a3689b5ece97101260ae6e0d')

install="$pkgname.install"

package() { 
	cd $pkgdir
	msg2 "Extracting RPMs"
	for i in $srcdir/*.rpm; do rpmextract.sh $i; done
	msg2 "Success"
	
	msg2 "Moving files around"
	mv lib/udev/ usr/lib/
	mv usr/lib64/* usr/lib/
	rm -r lib usr/lib64
	for i in program_options filesystem system serialization date_time; do
            ln -fs /usr/lib/libboost_$i.so usr/lib/libboost_$i.so.1.54.0
	done
	ln -s /usr/lib/libtcl.so usr/lib/libtcl8.5.so
	find . -exec chmod 755 {} \;
	
	msg2 "Creating log files"
	touch var/log/conveyor/conveyord.log
	chmod g+w var/log/conveyor/conveyord.log
	
}
