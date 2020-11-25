# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=xmenu-dchaovii-git
pkgver=4.4.1.r.
pkgrel=1
epoch=
pkgdesc="Personal build of xmenu just for gui power menu by DChaovII"
arch=("x86_64")
url="https://github.com/DChaovII/xmenu-dchaovii"
license=('MIT')
groups=()
depends=(imlib2)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=(xmenu)
replaces=(xmenu)
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "4.4.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd xmenu-dchaovii
	make
}

package() {
	cd xmenu-dchaovii
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX="${pkgdir}/usr" DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
