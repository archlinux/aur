# Maintainer: Syaoran Code <syaorancode@gmail.com>
pkgname=dwmblocks-syaoran-git
_dir=dwmblocks-syaoran
pkgver=0.1r5.af88124
pkgrel=1
epoch=
pkgdesc="dwmblocks for dwm"
arch=(x86_64)
url="https://gitlab.com/justanoobcoder/dwmblocks-syaoran.git"
license=('GPL')
groups=()
depends=(libx11 libxft-bgra-git bc pacman-contrib)
makedepends=(make)
checkdepends=()
optdepends=()
provides=(dwmblocks)
conflicts=(dwmblocks)
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
    cd "$_dir"
    printf "0.1r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_dir"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "$_dir"
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
