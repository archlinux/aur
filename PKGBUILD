# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Anthony Wang <ta180m@pm.me>
# Contributor: quellen <lodgerz@gmail.com>
# Contributor: Daniel Menelkir <menelkir@itroll.org>
_pkgbase=libretro-vice
pkgname=("$_pkgbase"-{x128,x64,x64dtv,x64sc,xcbm2,xcbm5x0,xpet,xplus4,xscpu64,xvic}-git)
pkgbase=$_pkgbase-git
pkgver=r21243.cd9b682
pkgrel=1
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/vice-libretro"
license=('GPL-2.0-or-later')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git' 'libgcc' 'libstdc++')
conflicts=("$pkgbase")
source=("$_pkgbase::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgbase
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd $_pkgbase
	# remove hardcoded optimization flags
	sed -Ei 's/-O([0123s]|fast)//' Makefile
	# remove hardcoded strip
	sed -i '/LDFLAGS/s/-s\b//' Makefile
}

build() {
	cd $_pkgbase
	make clean EMUTYPE=x128
	make all EMUTYPE=x128
	make clean EMUTYPE=x64
	make all EMUTYPE=x64
	make clean EMUTYPE=x64dtv
	make all EMUTYPE=x64dtv
	make clean EMUTYPE=x64sc
	make all EMUTYPE=x64sc
	make clean EMUTYPE=xcbm2
	make all EMUTYPE=xcbm2
	make clean EMUTYPE=xcbm5x0
	make all EMUTYPE=xcbm5x0
	make clean EMUTYPE=xpet
	make all EMUTYPE=xpet
	make clean EMUTYPE=xplus4
	make all EMUTYPE=xplus4
	make clean EMUTYPE=xscpu64
	make all EMUTYPE=xscpu64
	make clean EMUTYPE=xvic
	make all EMUTYPE=xvic
}

package_libretro-vice-x128-git() {
	pkgdesc="Commodore C128 core"
	depends+=('libgcc_s.so' 'libstdc++.so')
	provides=("$_pkgbase-x128=${pkgver#r}")
	conflicts+=("$_pkgbase-x128")

	cd $_pkgbase
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro vice_x128_libretro.so
}

package_libretro-vice-x64-git() {
	pkgdesc="Commodore C64 core (fast)"
	depends+=('libgcc_s.so' 'libstdc++.so')
	provides=("$_pkgbase-x64=${pkgver#r}")
	conflicts+=("$_pkgbase-x64")

	cd $_pkgbase
	install -D -t "$pkgdir"/usr/lib/libretro vice_x64_libretro.so
}

package_libretro-vice-x64dtv-git() {
	pkgdesc="Commodore C64DTV core"
	depends+=('libstdc++.so')
	provides=("$_pkgbase-x64dtv=${pkgver#r}")
	conflicts+=("$_pkgbase-x64dtv")

	cd $_pkgbase
	install -D -t "$pkgdir"/usr/lib/libretro vice_x64dtv_libretro.so
}

package_libretro-vice-x64sc-git() {
	pkgdesc="Commodore C64 core (accurate)"
	depends+=('libgcc_s.so' 'libstdc++.so')
	provides=("$_pkgbase-x64sc=${pkgver#r}")
	conflicts+=("$_pkgbase-x64sc")

	cd $_pkgbase
	install -D -t "$pkgdir"/usr/lib/libretro vice_x64sc_libretro.so
}

package_libretro-vice-xcbm2-git() {
	pkgdesc="Commodore CBM-II 6x0/7x0 core"
	depends+=('libgcc_s.so' 'libstdc++.so')
	provides=("$_pkgbase-xcbm2=${pkgver#r}")
	conflicts+=("$_pkgbase-xcbm2")

	cd $_pkgbase
	install -D -t "$pkgdir"/usr/lib/libretro vice_xcbm2_libretro.so
}

package_libretro-vice-xcbm5x0-git() {
	pkgdesc="Commodore CBM-II 5x0 core"
	depends+=('libgcc_s.so' 'libstdc++.so')
	provides=("$_pkgbase-xcbm5x0=${pkgver#r}")
	conflicts+=("$_pkgbase-xcbm5x0")

	cd $_pkgbase
	install -D -t "$pkgdir"/usr/lib/libretro vice_xcbm5x0_libretro.so
}

package_libretro-vice-xpet-git() {
	pkgdesc="Commodore PET core"
	depends+=('libgcc_s.so' 'libstdc++.so')
	provides=("$_pkgbase-xpet=${pkgver#r}")
	conflicts+=("$_pkgbase-xpet")

	cd $_pkgbase
	install -D -t "$pkgdir"/usr/lib/libretro vice_xpet_libretro.so
}

package_libretro-vice-xplus4-git() {
	pkgdesc="Commodore Plus/4 core"
	depends+=('libgcc_s.so' 'libstdc++.so')
	provides=("$_pkgbase-xplus4=${pkgver#r}")
	conflicts+=("$_pkgbase-xplus4")

	cd $_pkgbase
	install -D -t "$pkgdir"/usr/lib/libretro vice_xplus4_libretro.so
}

package_libretro-vice-xscpu64-git() {
	pkgdesc="Commodore C64 SuperCPU core"
	depends+=('libgcc_s.so' 'libstdc++.so')
	provides=("$_pkgbase-xscpu64=${pkgver#r}")
	conflicts+=("$_pkgbase-xscpu64")

	cd $_pkgbase
	install -D -t "$pkgdir"/usr/lib/libretro vice_xscpu64_libretro.so
}

package_libretro-vice-xvic-git() {
	pkgdesc="Commodore VIC-20 core"
	depends+=('libgcc_s.so' 'libstdc++.so')
	provides=("$_pkgbase-xvic=${pkgver#r}")
	conflicts+=("$_pkgbase-xvic")

	cd $_pkgbase
	install -D -t "$pkgdir"/usr/lib/libretro vice_xvic_libretro.so
}
