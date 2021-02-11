# Maintainer: Fronkles McFranko <mrelfranko@disroot.org>
pkgname=eww-git
_pkgname=eww
pkgver=cddcea7_2021.02.10_
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
    _commit=$(git rev-parse HEAD | cut -c1-7)
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "%s_%s_%s\n" "${_commit}" "${_date}" | sed 's/-/./g'
}

build() {
    cd "$_pkgname"
    cargo +nightly build --release
}

package() {
    cd "$_pkgname"

    install -D target/release/eww --target-directory "${pkgdir}/usr/bin" --mode 755
}
