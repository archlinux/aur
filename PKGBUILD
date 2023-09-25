# Maintainer: jwty <janoosh@catgirls.party>
# Contributor: maz-1 <ohmygod19993@gmail.com>

pkgname=deadbeef-plugin-vu-meter-git
pkgver=r8.77930b4
pkgrel=2
pkgdesc="Retro VU Meter Plugin for the DeaDBeeF audio player"
url="https://github.com/cboxdoerfer/ddb_vu_meter"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('deadbeef')
makedepends=('git' 'pkg-config' 'gtk2' 'gtk3')

_gitname=ddb_vu_meter
_gitroot=https://github.com/cboxdoerfer/${_gitname}

source=("git+$_gitroot"
	"https://raw.githubusercontent.com/houzhenggang/arch_vu_meter_patch/master/arch_vu_meter_patch")
md5sums=('SKIP'
         '3085ee0f1afd07c414827f11b62f0b6b')

pkgver() {
	cd "$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_gitname
	patch -p1 vumeter.c < "$srcdir/arch_vu_meter_patch"
	make
}

package() {
	install -D -v -c $srcdir/$_gitname/gtk2/ddb_vis_vu_meter_GTK2.so $pkgdir/usr/lib/deadbeef/ddb_vis_vu_meter_GTK2.so
	install -D -v -c $srcdir/$_gitname/gtk3/ddb_vis_vu_meter_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_vis_vu_meter_GTK3.so
	install -D -v -c $srcdir/$_gitname/vumeter.png $pkgdir/usr/lib/deadbeef/vumeter.png
}
