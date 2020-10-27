# Maintainer: Fronkles McFranko <mrelfranko@disroot.org>
pkgname=eww-git
_pkgname=eww
pkgver=dd3c50f
pkgrel=1
epoch=
pkgdesc="ElKowar's wacky widgets"
arch=('any')
url="https://github.com/elkowar/eww"
license=('GPL')
groups=()
depends=()
makedepends=("cargo" "git")
checkdepends=()
optdepends=()
provides=()
conflicts=("eww")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/elkowar/eww")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
    cd $_pkgname
    printf "%s" "$(git describe --always --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$_pkgname"
    cargo build
}

check() {
	cd "$_pkgname"
    cargo check
}

package() {
	cd "$_pkgname"
    cargo install --path . --root "$pkgdir/usr"

    cd "$pkgdir/usr"
    rm .crates2.json .crates.toml
}
