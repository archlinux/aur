# Maintainer: Atif Chowdhury <iftakhar.awal@gmail.com>
pkgname=eww-git
_pkgname=eww
pkgver=0.1.0.r164.g70285e0
pkgrel=2
epoch=
pkgdesc="ElKowar's wacky widgets"
arch=('any')
url="https://github.com/elkowar/eww"
license=('MIT')
groups=()
depends=("gtk3")
makedepends=("rustup" "git")
checkdepends=()
optdepends=()
provides=("eww")
conflicts=("eww")
replaces=()
backup=()
options=()
install="${_pkgname}.install"
changelog=
source=("git+https://github.com/elkowar/eww")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
    cd ${_pkgname}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    rustup toolchain install nightly
    cargo +nightly build --release
}

package() {
    cd "$_pkgname"

    install -Dm755 target/release/eww "${pkgdir}/usr/bin/${_pkgname}"
    mkdir -p "${pkgdir}/etc/xdg/${_pkgname}"
    cp -r examples/eww-bar "${pkgdir}/etc/xdg/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

