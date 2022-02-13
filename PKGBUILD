# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=dmenu-demonkingswarn-git
pkgver=4.9_r2.c2477ce
pkgrel=1
epoch=
pkgdesc="This is my personal build of dmenu patched for clean floating look."
arch=(x86_64 i686)
url="https://github.com/demonkingswarn/mydmenu"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(dmenu)
conflicts=(dmenu)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "4.9_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd mydmenu
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 
}

package() {
	cd mydmenu
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="${pkgver}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/README/${pkgname}/README.md"
}
