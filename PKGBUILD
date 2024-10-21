# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=nsxiv-demon
_pkgname=nsxiv
pkgver=5.0.r1049.c216a40
pkgrel=1
epoch=
pkgdesc="A build of nsxiv which looks better."
arch=(x86_64)
url="https://github.com/demonkingswarn/nsxiv.git"
license=('GPL-2.0')
groups=()
depends=(ttf-jetbrains-mono ttf-jetbrains-mono-nerd)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(nsxiv)
conflicts=(nsxiv)
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
    printf "5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
    make
}

package() {
    cd ${_pkgname}
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

