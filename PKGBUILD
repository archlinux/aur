# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Evan H. Moore <evmoore43@gmail.com>
pkgname=gpu-passthrough-manager
pkgver=1.2
pkgrel=1
pkgdesc="GPU passthrough made easy."
arch=('x86_64')
url="https://github.com/uwzis/gpu-passthrough-manager"
license=('GPL')
groups=()
depends=(python3)
makedepends=('git' 'jsoncpp' 'glib'  'gtk' 'gcc')
install=
source=("git+$url")
md5sums=('SKIP')

build() {
	cd ${pkgname}
	sh ./Build.sh
	
}


package() {
	cd "$pkgname"	
	install -dm755 ${pkgdir}/usr/share/gpu-passthrough-manager

	cp -r --no-preserve=mode,ownership "${srcdir}/gpu-passthrough-manager/icons" "${pkgdir}/usr/share/gpu-passthrough-manager"
	cp -r --no-preserve=mode,ownership "${srcdir}/gpu-passthrough-manager/py" "${pkgdir}/usr/share/gpu-passthrough-manager"
	cp -r --no-preserve=mode,ownership "${srcdir}/gpu-passthrough-manager/tools" "${pkgdir}/usr/share/gpu-passthrough-manager"
	cp --no-preserve=mode,ownership "${srcdir}/gpu-passthrough-manager/style.css" "${pkgdir}/usr/share/gpu-passthrough-manager"
	cp --no-preserve=mode,ownership "${srcdir}/gpu-passthrough-manager/GPUPM" "${pkgdir}/usr/share/gpu-passthrough-manager"
	chmod +x "${pkgdir}/usr/share/gpu-passthrough-manager/GPUPM"
	chmod +x "${pkgdir}/usr/share/gpu-passthrough-manager/tools/Reboot"

	install -dm755 ${pkgdir}/usr/bin
	cp --no-preserve=mode,ownership "${srcdir}/gpu-passthrough-manager/gpu-passthrough-manager" "${pkgdir}/usr/bin/"
	chmod +x "${pkgdir}/usr/bin/gpu-passthrough-manager"	

	install -dm755 ${pkgdir}/usr/share/applications
	cp --no-preserve=mode,ownership "${srcdir}/gpu-passthrough-manager/icons/GPU Passthrough Manager.desktop" "${pkgdir}/usr/share/applications/"

	install -dm755 ${pkgdir}/usr/share/doc/gpu-passthrough-manager
	cp --no-preserve=mode,ownership "${srcdir}/gpu-passthrough-manager/README.md" "${pkgdir}/usr/share/doc/gpu-passthrough-manager"
}
