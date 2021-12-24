# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Javier Ribal del Río <javierribal@gmail.com>
pkgname=quit-git
pkgver=2.0.r107.377e75d
pkgrel=1
epoch=
pkgdesc="Quit is an application for Linux terminal to shutdown, reboot or suspend the computer. You can also set a timed shutdown or a timed reboot."
arch=(x86_64 i686)
url="https://github.com/JavierRibaldelRio/quit.git"
license=('MIT ')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(quit)
conflicts=(quit)
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
	cd quit
	printf "2.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd quit
	./configure --prefix=/usr
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

check() {
	cd quit
	make -k check
}

package() {
	cd quit
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="{$pkgdir}" install
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	install -Dm64 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
