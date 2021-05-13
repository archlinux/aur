# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ederson Ferreira <edersondeveloper@gmail.com>
pkgname=dmenu-edersonferreira
pkgver=1.1.r.
pkgrel=1
epoch=
pkgdesc="My personal Dmenu build with my configs."
arch=(x86_64 i686)
url="https://github.com/edersonferreira/dmenu-edersonferreira"
license=('MIT')
groups=()
depends=(ttf-fira-code)
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
	printf "1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd dmenu
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd dmenu
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.org"
}
