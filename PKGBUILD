# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Neeraj Singhal <neerajsinghal93@gmail.com>
pkgname=nse-btop-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="test package for btop"
arch=(x86_64 i686)
url="https://github.com/aristocratos/btop/blob/main/LICENSE"
license=('Apache')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(nse-btop)
conflicts=(nse-btop)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver(){
	cd "${_pkgname}"
	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${_$pkgname}"
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
