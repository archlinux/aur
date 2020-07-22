# Maintainer: Manuel Altalef <maltalef101@gmail.com>
pkgname=st-maltalef-git
_pkgname=st
pkgver=0.8.2.r5.077c55b
pkgrel=1
epoch=
pkgdesc="maltalef's build of Suckless' simple terminal (st)."
arch=('x86_64' 'i686')
url="https://github.com/maltalef101/st.git"
license=('MIT')
options=(zipman)
depends=('libxft' 'ttf-dejavu')
makedepends=('ncurses' 'libxext' 'git')
checkdepends=()
optdepends=('dmenu: feed url to dmenu')
provides=(st)
conflicts=(st)
replaces=()
backup=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
    printf "0.8.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${_pkgname}"
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

