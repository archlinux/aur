# Maintainer: Ashin Antony <ashinant15@gmail.com>
pkgname=dmenu-ashin-git
pkgver=5.0
pkgrel=1
epoch=
pkgdesc="A build of dmenu patched for centering, borders, grids, numbers, line height, mouse support, fuzzy matching and highlighting."
arch=(x86_64 i686)
url="https://www.github.com/ashincoder/dmenu-ashin.git"
license=('MIT')
groups=()
depends=(ttf-hack ttf-joypixels libx11)
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
	cd dmenu-ashin
    printf "5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd dmenu-ashin
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd dmenu-ashin  
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
