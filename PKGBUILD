# Maintainer: Jingrong Chen <crazyboycjr at gmail dot com>
pkgname=motionpro
_pkgname=${pkgname//-/_}
pkgver=1.1.1
pkgrel=1
pkgdesc="Array Networks, MotionPro VPN, version 9.3.0.274"
arch=('x86_64')
url="https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/downloads.html"
license=('none')
depends=()
source=("https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/motionpro/Linux/Ubuntu/20171228/MotionPro_Linux_Ubuntu_x86-64_1.1.1.sh")

package() {
	chmod +x "MotionPro_Linux_Ubuntu_x86-64_1.1.1.sh"
	"./MotionPro_Linux_Ubuntu_x86-64_1.1.1.sh" --keep --noexec
	cd MotionPro_Linux
	sed -i '30,33d' ./install.sh
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
md5sums=('a91c75ef4dfa1dc5629470c95630ca6d')
