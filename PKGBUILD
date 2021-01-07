# Maintainer: Fronkles McFranko <mrelfranko@disroot.org>
pkgname=eww-git
_pkgname=eww
pkgver=145__2021.01.03
pkgrel=1
epoch=
pkgdesc="ElKowar's wacky widgets"
arch=('any')
url="https://github.com/elkowar/eww"
license=('MIT')
groups=()
depends=("gtk3")
makedepends=("cargo" "git")
checkdepends=()
optdepends=()
provides=("eww")
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
    cd ${_pkgname}
    _tag=$(git describe --tags | sed 's:^v::')
    _commits=$(git rev-list --count HEAD)
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "%s_%s_%s\n" "${_commits}" "${_tag}" "${_date}" | sed 's/-/./g'
}

build() {
    cd "$_pkgname"
    cargo build --release
}

package() {
    cd "$_pkgname"

    mkdir -p "${pkgdir}/usr/bin"
    mv target/release/eww "${pkgdir}/usr/bin"
}
