# Maintainer: pkg_maintainer <archlinuxpackagemaintainer@gmail.com>
pkgname=universal-android-debloater-git
pkgver=0.5.0.r14.dabf7a6
pkgrel=1
epoch=
pkgdesc="An android debloater application written in rust credit to w1nst0n (0x192) @github"
arch=('x86_64')
url="https://github.com/0x192/universal-android-debloater.git"
license=('GPL3')
groups=()
depends=(rustup cargo android-tools android-udev)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(universal-android-debloater-git)
conflicts=()
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
    printf "0.5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd universal-android-debloater
	rustup toolchain install nightly
	rustup override set nightly
	cargo build --release
}

package() {
    cd universal-android-debloater
    install -Dm755 target/release/uad_gui "${pkgdir}/usr/bin/universal-android-debloater-gui" 
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

