# Maintainer: zhs <zhao4she4@tuta.io>

pkgname=vapoursynth-plugin-vsmxnet-git
_pkgname=vs_mxnet
pkgver=v0.2.2.0.g26a7b79
pkgrel=1
pkgdesc="Use MXNet to accelerate image processing in VapourSynth (git version), modified to compile on Linux"
arch=('x86_64')
url="https://github.com/kice/vs_mxnet"
license=('MPL-2.0')
depends=('vapoursynth' 'mxnet' 'opencv')
makedepends=('git' 'vapoursynth' 'mxnet' 'opencv')
source=("git+https://github.com/kice/vs_mxnet")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git describe --long --tags | tr - .)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	ln -sf ../../Makefile.custom Makefile
	patch -Np1 -i ../../linux-compile.patch 
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
