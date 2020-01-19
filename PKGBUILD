# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=ghdlsynth-beta-git
pkgver=r103.910073d
pkgrel=1
arch=('x86_64')
pkgdesc='VHDL synthesis (based on ghdl)'
url='https://github.com/tgingold/ghdlsynth-beta'
license=('GPL3')

provides=('ghdlsynth-beta' 'ghdlsynth')
conflicts=('ghdlsynth-beta' 'ghdlsynth')
makedepends=('git' 'yosys' 'clang')
depends=('ghdl>0.36' 'yosys' 'gcc-libs')

source=("ghdlsynth::git://github.com/tgingold/ghdlsynth-beta.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/ghdlsynth"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/ghdlsynth"

	make ghdl.so
}

package() {
	cd "${srcdir}/ghdlsynth"

	install -Dm755 -t "$pkgdir/$(yosys-config --datdir)/plugins/" ghdl.so
	install -dm755 "$pkgdir/usr/share/ghdlsynth/examples/"
	cp -r examples/* "$pkgdir/usr/share/ghdlsynth/examples/"
}
