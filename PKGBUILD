# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname='ccminer'
pkgname="${_pkgname}-git"
pkgver=r917.b54be47
pkgrel=1
pkgdesc="Coin miner using CUDA for nVidia GPUs."
arch=('x86_64')
url="http://ccminer.org/"
license=('GPL3')
depends=('cuda' 'curl' 'jansson' 'nvidia-utils')
makedepends=('git' 'cuda' 'nvidia-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("git+https://github.com/tpruvot/ccminer.git#branch=linux")
sha256sums=('SKIP')

pkgver() {
	cd "ccminer"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "ccminer"

	./autogen.sh
	./configure CUDA_CFLAGS='--shared --compiler-options "-fPIC"' \
		--prefix=/usr --sysconfdir=/etc --libdir=/usr/lib --with-cuda=/opt/cuda

	make
}

package() {
	cd "ccminer"

	make DESTDIR="${pkgdir}" install
}
