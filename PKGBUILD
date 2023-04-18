# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=yosys-nightly
pkgver=20230418_yosys_0.28_2_ga9c792dce
pkgrel=2
epoch=1
pkgdesc="Yosys Open SYnthesis Suite, A framework for RTL synthesis"
arch=("x86_64")
url="https://yosyshq.net/yosys/"
license=("custom:ISC")
groups=()
options=("!strip")
depends=("tcl" "libffi" "python" "boost-libs" "zlib" "readline")
optdepends=("graphviz: Schematics display support" "xdot: Design netlist display support")
makedepends=("git" "gcc" "bison" "flex" "pkgconf" "gawk" "protobuf" "iverilog")
conflicts=("yosys" "yosys-git")
replaces=("yosys" "yosys-git")
source=("yosys::git+https://github.com/YosysHQ/yosys.git#commit=a9c792dce"
		"yosys.conf")
sha256sums=(
	"SKIP"
	"7513c07ccaf3ff00b1692348ece8a44ee48a7b9f5318f773de78d7538e82c127"
)

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/yosys"
	make config-gcc
	cp "${srcdir}/yosys.conf" Makefile.conf
}

build() {
	cd "${srcdir}/yosys"
	make PREFIX="${_PREFIX}"
}

package() {
	cd "${srcdir}/yosys"
	make STRIP=':' PREFIX="${_PREFIX}" PYTHON_PREFIX="${pkgdir}${_PREFIX}" DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/yosys/LICENSE"
}
