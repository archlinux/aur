# Maintainer: beanie

_pkgname=nvidia-prime-select
pkgname=${_pkgname}-git
pkgver=20191010.902aa9a
pkgrel=1
pkgdesc='A collection of shell scripts that makes it possible to use the NVIDIA GPU on a Optimus Laptop, similar to the feature provided by the nvidia-prime package in Ubuntu. Forked by wildtruc'

url='https://github.com/wildtruc/nvidia-prime-select'
arch=('any')
license=('GPL')

depends=('nvidia')
makedepends=('git')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+https://github.com/wildtruc/nvidia-prime-select.git")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 nvidia-prime-ui "${pkgdir}/usr/bin/nvidia-prime-ui" 
	install -Dm755 nvidia-prime-select "${pkgdir}/usr/bin/nvidia-prime-select"
	install -Dm644 -t "${pkgdir}/etc/nvidia-prime/" xorg.nvidia.conf
	install -Dm644 -t "${pkgdir}/etc/nvidia-prime/" xorg.offload.conf
	install -Dm644 -t "${pkgdir}/etc/nvidia-prime/" xorg.intel.conf
	install -Dm644 -t "${pkgdir}/etc/nvidia-prime/" library.conf
	install -Dm644 -t "${pkgdir}/etc/nvidia-prime/" options.conf
	install -Dm644 -t "${pkgdir}/etc/nvidia-prime/" report.sample
	install -Dm644 -t "${pkgdir}/etc/nvidia-prime/" nvidia-prime.desktop
	install -Dm644 -t "${pkgdir}/etc/nvidia-prime/" nvidia-session.desktop
	install -Dm644 -t "${pkgdir}/usr/share/pixmaps/" nvidia-prime.png
	install -Dm644 -t "${pkgdir}/usr/share/applications/" nvidia-prime-ui.desktop
	install -Dm644 -t "${pkgdir}/usr/share/polkit-1/actions/" com.github.pkexec.nvidia-prime-select.policy
	install -Dm644 -t "${pkgdir}/usr/share/polkit-1/actions/" com.github.pkexec.nvidia-prime-editor.policy
}
