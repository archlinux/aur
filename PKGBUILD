# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Marten Kante <tiyn@martenkante.eu>
pkgname=dmenu-tiyn-git
pkgver=4.9.r12.446fd55
pkgrel=1
epoch=
pkgdesc="This is the dmenu build of tiyn. It includes the border, center and password patches."
arch=(x86_64 i686)
url="https://github.com/tiyn/dmenu"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(dmenu)
conflicts=(dmenu)
replaces=(dmenu)
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
    printf "4.9.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
