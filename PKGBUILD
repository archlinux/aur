# Maintainer: Vitali64
# If you have any issues, please open an issue on the project's gitlab page
pkgname=vitali64-dwm-git
pkgver=6.2
pkgrel=1
epoch=
pkgdesc="A simple, fast and boring dwm fork that I made for no reason, NOW IN THE AUR !"
arch=(x86_64 i686)
url="https://gitlab.com/vitali64/dots/v64-dwm"
license=('MIT')
groups=()
depends=(xorg-server)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(dwm)
conflicts=(dwm)
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
    printf "6.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd v64-dwm
	make
}


package() {
	cd v64-dwm
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
