# Maintainer: Yazhou Tang <tangyazhou518 at outlook dot com>
# Contributor: Jingrong Chen <crazyboycjr at gmail dot com>
# Contributor: Kim "BKC" Carlbäcker
pkgname=motionpro-gui
_pkgname=${pkgname//-/_}
pkgver=9.4.0.505
pkgrel=1
pkgdesc="Array Networks VPN Client for Linux (gui)"
arch=('x86_64')
url="https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/downloads.html"
license=('unknown')
depends=('freetype2' 'qt5-base')
source=("https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/pkg_9_4_0_505/MP_Linux_1.2.18/MotionPro_Linux_Ubuntu_x64_build-8383-34.sh")
prepare() {
    chmod +x "MotionPro_Linux_Ubuntu_x64_build-8383-34.sh"
    "./MotionPro_Linux_Ubuntu_x64_build-8383-34.sh" --keep --noexec
	cd MotionPro_Linux
    sed -i '35,39d' ./install.sh # remove root check
    sed -i '21,25d;36,44d;47,48d;55,66d;126,129d' ./install.sh # remove auto start script
	sed -i "s#prefix=#prefix=${pkgdir}#" ./install.sh
	sed -i '/^prefix=/amkdir -p $prefix' ./install.sh
	sed -i "s#target_dir=#target_dir=${pkgdir}#" ./install.sh
	sed -i '/^target_dir=/amkdir -p $target_dir' ./install.sh
	sed -i "s#hardware=\"#hardware=\"${pkgdir}#" ./install.sh
	sed -i '/^hardware=/amkdir -p $hardware' ./install.sh
	sed -i "s#desktop_target=#desktop_target=${pkgdir}#" ./install.sh
	sed -i '/^desktop_target=/amkdir -p $desktop_target' ./install.sh
	sed -i '2aset -x' ./install.sh
}

package() {
	cd MotionPro_Linux
	./install.sh
	rm "$pkgdir/opt/MotionPro/"libQt5*
}
sha256sums=('5e9f123829a9bacef290768282c6e071ee811659440ab67cf2192f6394e36869')
