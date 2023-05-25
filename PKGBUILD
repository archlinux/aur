# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Anthony Wang <ta180m@pm.me>
# Contributor: quellen <lodgerz@gmail.com>
# Contributor: Daniel Menelkir <menelkir@itroll.org>
pkgbase=libretro-vice-git
pkgname=(libretro-vice-{x128,x64dtv,x64sc,xcbm2,xcbm5x0,xpet,xplus4,xscpu64,xvic}-git)
pkgver=r21112.953e668f1
pkgrel=1
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/vice-libretro"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git')
conflicts=('libretro-vice-git')
source=("vice-libretro::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd vice-libretro
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd vice-libretro
	sed -i 's/-O[0123s]//;s/-Ofast//' Makefile
	sed -i '/LDFLAGS/s/-s\b//' Makefile
}

build() {
	cd vice-libretro
	make clean EMUTYPE=x128
	make EMUTYPE=x128
	# make clean EMUTYPE=x64
	# make EMUTYPE=x64
	make clean EMUTYPE=x64dtv
	make EMUTYPE=x64dtv
	make clean EMUTYPE=x64sc
	make EMUTYPE=x64sc
	make clean EMUTYPE=xcbm2
	make EMUTYPE=xcbm2
	make clean EMUTYPE=xcbm5x0
	make EMUTYPE=xcbm5x0
	make clean EMUTYPE=xpet
	make EMUTYPE=xpet
	make clean EMUTYPE=xplus4
	make EMUTYPE=xplus4
	make clean EMUTYPE=xscpu64
	make EMUTYPE=xscpu64
	make clean EMUTYPE=xvic
	make EMUTYPE=xvic
}

package_libretro-vice-x128-git() {
	pkgdesc="Commodore C128 core"
	provides=("libretro-vice-x128=${pkgver#r}")
	conflicts+=('libretro-vice-x128')

	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro vice-libretro/vice_x128_libretro.so
}

# package_libretro-vice-x64-git() {
# 	pkgdesc="Commodore C64 core (fast)"
# 	provides=("libretro-vice-x64=${pkgver#r}")
# 	conflicts+=('libretro-vice-x64')

# 	install -D -t "$pkgdir"/usr/lib/libretro vice-libretro/vice_x64_libretro.so
# }

package_libretro-vice-x64dtv-git() {
	pkgdesc="Commodore C64DTV core"
	provides=("libretro-vice-x64dtv=${pkgver#r}")
	conflicts+=('libretro-vice-x64dtv')

	install -D -t "$pkgdir"/usr/lib/libretro vice-libretro/vice_x64dtv_libretro.so
}

package_libretro-vice-x64sc-git() {
	pkgdesc="Commodore C64 core (accurate)"
	provides=("libretro-vice-x64sc=${pkgver#r}")
	conflicts+=('libretro-vice-x64sc')

	install -D -t "$pkgdir"/usr/lib/libretro vice-libretro/vice_x64sc_libretro.so
}

package_libretro-vice-xcbm2-git() {
	pkgdesc="Commodore CBM-II 6x0/7x0 core"
	provides=("libretro-vice-xcbm2=${pkgver#r}")
	conflicts+=('libretro-vice-xcbm2')

	install -D -t "$pkgdir"/usr/lib/libretro vice-libretro/vice_xcbm2_libretro.so
}

package_libretro-vice-xcbm5x0-git() {
	pkgdesc="Commodore CBM-II 5x0 core"
	provides=("libretro-vice-xcbm5x0=${pkgver#r}")
	conflicts+=('libretro-vice-xcbm5x0')

	install -D -t "$pkgdir"/usr/lib/libretro vice-libretro/vice_xcbm5x0_libretro.so
}

package_libretro-vice-xpet-git() {
	pkgdesc="Commodore PET core"
	provides=("libretro-vice-xpet=${pkgver#r}")
	conflicts+=('libretro-vice-xpet')

	install -D -t "$pkgdir"/usr/lib/libretro vice-libretro/vice_xpet_libretro.so
}

package_libretro-vice-xplus4-git() {
	pkgdesc="Commodore Plus/4 core"
	provides=("libretro-vice-xplus4=${pkgver#r}")
	conflicts+=('libretro-vice-xplus4')

	install -D -t "$pkgdir"/usr/lib/libretro vice-libretro/vice_xplus4_libretro.so
}

package_libretro-vice-xscpu64-git() {
	pkgdesc="Commodore C64 SuperCPU core"
	provides=("libretro-vice-xscpu64=${pkgver#r}")
	conflicts+=('libretro-vice-xscpu64')

	install -D -t "$pkgdir"/usr/lib/libretro vice-libretro/vice_xscpu64_libretro.so
}

package_libretro-vice-xvic-git() {
	pkgdesc="Commodore VIC-20 core"
	provides=("libretro-vice-xvic=${pkgver#r}")
	conflicts+=('libretro-vice-xvic')

	install -D -t "$pkgdir"/usr/lib/libretro vice-libretro/vice_xvic_libretro.so
}
