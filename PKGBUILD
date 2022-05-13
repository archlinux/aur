# Maintainer: Yazhou Tang <tangyazhou518 at outlook dot com>
# Contributor: Jingrong Chen <crazyboycjr at gmail dot com>
pkgname=motionpro-gui
_pkgname=${pkgname//-/_}
pkgver=9.4.0.446
pkgrel=1
pkgdesc="Array Networks VPN Client for Linux (gui)"
arch=('x86_64')
url="https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/downloads.html"
license=('none')
depends=()
source=("https://support.arraynetworks.net/prx/000/http/supportportal.arraynetworks.net/downloads/pkg_9_4_0_446/MP_Linux_1.2.14/MotionPro_Linux_Ubuntu_x64.sh")

package() {
	chmod +x "MotionPro_Linux_Ubuntu_x64.sh"
	"./MotionPro_Linux_Ubuntu_x64.sh" --keep --noexec
	cd MotionPro_Linux
	sed -i '32,36d' ./install.sh
	sed -i "s#prefix=#prefix=${pkgdir}#" ./install.sh
	sed -i '/^prefix=/amkdir -p $prefix' ./install.sh
	sed -i "s#target_dir=#target_dir=${pkgdir}#" ./install.sh
	sed -i '/^target_dir=/amkdir -p $target_dir' ./install.sh
	sed -i "s#hardware=\"#hardware=\"${pkgdir}#" ./install.sh
	sed -i '/^hardware=/amkdir -p $hardware' ./install.sh
	sed -i "s#start_script_path1=\"#start_script_path1=\"${pkgdir}#" ./install.sh
	sed -i "s#start_script_path2=\"#start_script_path2=\"${pkgdir}#" ./install.sh
	sed -i "s#desktop_target=#desktop_target=${pkgdir}#" ./install.sh
	sed -i '/^desktop_target=/amkdir -p $desktop_target' ./install.sh
	./install.sh
}
md5sums=('c715144c9889001c5ddd83d17efd8b17')
