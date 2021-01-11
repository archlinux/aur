# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jackson McCrory <jackson@mccrory.xyz>
pkgname=aslstatus-jadecell-git
pkgver=0.9
pkgrel=1
epoch=
pkgdesc="JadeCell's build of aslstatus (multi-threaded slstatus)."
arch=(x86_64 i686)
url="https://gitlab.com/jadecell/aslstatus.git"
license=('MIT')
groups=()
depends=()
makedepends=(git make)
checkdepends=()
optdepends=()
provides=(aslstatus)
conflicts=(aslstatus)
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
    printf "0.9.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd aslstatus
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd aslstatus
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
