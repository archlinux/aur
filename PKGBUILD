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

check() {
	cd "${srcdir}/${_pkgname}"
	bash -n *.sh
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 nvidia-prime-ui usr/bin
	install -Dm755 nvidia-prime-select usr/sbin
	install -Dm644 xorg.nvidia.conf etc/nvidia-prime
	install -Dm644 xorg.offload.conf etc/nvidia-prime
	install -Dm644 xorg.intel.conf etc/nvidia-prime
	install -Dm644 library.conf etc/nvidia-prime
	install -Dm644 options.conf etc/nvidia-prime
	install -Dm644 report.sample etc/nvidia-prime
	install -Dm644 nvidia-prime.desktop etc/nvidia-prime
	install -Dm644 nvidia-session.desktop etc/nvidia-prime
	install -Dm644 nvidia-prime.png usr/share/pixmaps
	install -Dm644 nvidia-prime-ui.desktop usr/share/applications
	install -Dm644 com.github.pkexec.nvidia-prime-select.policy  usr/share/polkit-1/actions
	install -Dm644 com.github.pkexec.nvidia-prime-editor.policy usr/share/polkit-1/actions
	bash ./changelog.sh
}
