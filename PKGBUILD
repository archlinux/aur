# Maintainer: Markus Koch <markus@notsyncing.net>

# BUILD INSTRUCTIONS:
#
# 1. Download and copy questa_sim-2022.4.aol to the same directory as the PKGBUILD.
# 2. [optional] Edit the end of `batchInstall.sh` to select product features.
#    Default: Only the QuestaSim simulator for VHDL + (System) Verilog.
# 3. Run `makepkg`.

pkgname=questasim
pkgver=2022.4
pkgrel=1
pkgdesc="The Questa advanced simulator is the core simulation and debug engine of the Questa verification solution."
arch=('x86_64')
url="https://eda.sw.siemens.com/en-US/ic/questa/simulation/advanced-simulator/"
license=('proprietary')
groups=()
depends=(freetype2)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("file://questa_sim-2022.4.aol" batchInstall.sh questasim.png questasim.desktop)
noextract=()
md5sums=('496e550fac5cd7579c8dabc19081fd5c'
         'SKIP'
         '5e23c736187b6ae30cc93cc8d03f4bd1'
         '5f29fd57a8e52fd14d901ff36e918c0b')

build() {
	cd "$srcdir"
}

bin_symlink() {
	for prog in "$@"; do
		ln -s /opt/questasim/linux_x86_64/$prog $pkgdir/usr/bin/$prog
	done
}

package() {
	cd "$srcdir"
	./batchInstall.sh -tgt $pkgdir/opt
	rm -rf $pkgdir/opt/_msidata

	# link important binaries to /usr/bin/
	mkdir -p $pkgdir/usr/bin/
	bin_symlink vsim vcom vopt vlog vish vdel vmap xml2ucdb wlfrecover vdbg verror vencrypt voptclassic voptk vgencomp voptk2 mc2voptk2 vhencrypt vovl vcd2wlf vsimk vlm vmake vdbgpa 

	# install .desktop
	install -D $srcdir/questasim.png $pkgdir/opt/questasim/questasim.png
	install -D $srcdir/questasim.desktop $pkgdir/usr/share/applications/questasim.desktop
}

