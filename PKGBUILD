# Maintainer: zhs <zhao4she4@tuta.io>

pkgname=vapoursynth-plugin-vsmxnet-git
_pkgname=vs_mxnet
pkgver=v0.2.2.0.g26a7b79
pkgrel=1
pkgdesc="Use MXNet to accelerate image processing in VapourSynth (git version), modified to compile on Linux"
arch=('x86_64')
url="https://github.com/kice/vs_mxnet"
license=('MPL2')
depends=('vapoursynth' 'mxnet')
makedepends=('git')
source=("git+https://github.com/kice/vs_mxnet"
	"Makefile.custom"
	"linux-compile.patch")
sha256sums=('SKIP'
	    '6b214d9e7a2c227813b62087365453d181e7be40f82fca7f4573da04792acfe5'
            'ba5011e9e638d64db622b9080b3b2c423ce6941f9d248088e7aec10f0f6f7b59')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git describe --long --tags | tr - .)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	ln -sf ../Makefile.custom Makefile
	patch -Np1 -i ../linux-compile.patch 
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
