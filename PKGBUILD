# Maintainer: tho <trees@hateorcs.com>
# Maintainer: Rishabh Das <rdas@tutanota.com>
pkgname='wmenu-git'
pkgver=0.1.9+6.ge2542d34ed
pkgrel=2
pkgdesc="An efficient dynamic menu for Sway and wlroots based Wayland compositors"
arch=('x86_64')
url="https://codeberg.org/adnano/wmenu/" 
license=('MIT')
depends=('cairo' 'pango' 'wayland' 'libxkbcommon')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wayland-protocols')
provides=('wmenu')
conflicts=('wmenu')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C wmenu describe --abbrev=10 | sed 's/-/+/; s/-/./'
}

build() {
	cd wmenu
	meson --prefix="/usr" --buildtype=release -Db_lto=true build
	ninja -C build
}

package() {
	cd wmenu
	DESTDIR="${pkgdir}/" ninja -C build install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/wmenu/LICENSE"
}
