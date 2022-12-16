# Maintainer: Prasad Zore <prasad.zore@outlook.com>
pkgname=intel-nvidia-switch-bin

pkgver=0.1.0

pkgrel=1

pkgdesc="A small utility to switch GPU on Intel-Nvidia Hybrid Graphics Systems"

arch=('x86_64')

url="https://github.com/prasadthx/Intel-Nvidia-Switch"

license=('MIT')

depends=('nvidia-utils' 'xf86-video-intel')

makedepends=('git')

optdepends=('nvidia-prime')

install="intel-nvidia-switch.install"

source=("${url}/releases/download/v${pkgver}/intel-nvidia-switch-v${pkgver}.tar.gz")

md5sums=('3321a2802a4847f64b83e851225ff164')

package() {
	cd "${srcdir}/${pkgname/-bin/}-v${pkgver}"

	local conf_dir="${pkgdir}/etc/intel-nvidia-switch/configs"
	
	install -Dm755 bin/intel-nvidia-switch "${pkgdir}/usr/bin/intel-nvidia-switch"

	install -Dm644 configs/intel/00-remove-nvidia.rules "${conf_dir}/intel/00-remove-nvidia.rules"
	install -Dm644 configs/intel/blacklist-nvidia.conf "${conf_dir}/intel/blacklist-nvidia.conf"
	install -Dm644 configs/nvidia/10-nvidia-drm-outputclass.conf "${conf_dir}/nvidia/10-nvidia-drm-outputclass.conf"	
	install -Dm644 configs/nvidia/10-gpu-xrandr.sh "${conf_dir}/nvidia/10-gpu-xrandr.sh"
	install -Dm644 configs/hybrid/80-nvidia-pm.rules "${conf_dir}/hybrid/80-nvidia-pm.rules"
	install -Dm644 configs/hybrid/nvidia-pm.conf "${conf_dir}/hybrid/nvidia-pm.conf"
}

