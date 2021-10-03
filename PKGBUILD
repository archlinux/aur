# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=icestorm-nightly
pkgver=83b8ef9_20211003
pkgrel=1
epoch=1
pkgdesc="Lattice iCE40 FPGAs Bitstream Documentation"
arch=("any")
url="https://github.com/YosysHQ/icestorm"
license=("custom:ISC")
groups=()
options=("!strip")
depends=("python" "libftdi-compat")
optdepends=()
makedepends=("git" "make" "gcc")
conflicts=("icestorm-git")
replaces=("icestorm-git")
source=(
	"icestorm::git+https://github.com/YosysHQ/icestorm.git"#commit=83b8ef9
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"
build() {
	cd "${srcdir}/icestorm"
	make CXX=g++ PREFIX="${_PREFIX}" -j $(nproc)
	cd ..
}

package() {
	cd "${srcdir}/icestorm"
	make PREFIX="${_PREFIX}" DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/icestorm/LICENSE"
	cd ..
}
