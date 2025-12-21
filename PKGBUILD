# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=icestorm-nightly
pkgver=20251221_v1.1
pkgrel=1
epoch=1
pkgdesc="Lattice iCE40 FPGAs Bitstream Documentation"
arch=("x86_64")
url="https://github.com/YosysHQ/icestorm"
license=("custom:ISC")
groups=()
options=("!strip")
depends=("python" "libftdi-compat")
optdepends=()
makedepends=("git" "make" "gcc")
provides=("icestorm")
conflicts=("icestorm-git")
replaces=()
source=(
	"icestorm::git+https://github.com/YosysHQ/icestorm.git#commit=f31c39c"
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"
build() {
	cd "${srcdir}/icestorm"
	make CXX=g++ PREFIX="${_PREFIX}"

}

package() {
	cd "${srcdir}/icestorm"
	make PREFIX="${_PREFIX}" DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/icestorm/LICENSE"
}
