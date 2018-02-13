# Maintainer: Ho Tuan Kiet <tuankiet65@gmail.com>
# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname='ccminer'
pkgname="${_pkgname}-allium-git"
pkgver=r925.81931e3
pkgrel=1
pkgdesc="Cryptocurrency miner for nVidia GPUs using CUDA (with support for Allium algorithm used by Garlicoin)."
arch=('x86_64')
url="http://ccminer.org/"
license=('GPL3')
depends=('cuda' 'curl' 'jansson' 'nvidia-utils')
makedepends=('git' 'cuda' 'nvidia-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("git+https://github.com/lenis0012/ccminer/")
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
