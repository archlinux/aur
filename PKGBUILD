# Maintainer: Namkhai B. <echo em.roekn@kn | rev>

_pkgname=gyr
pkgname=${_pkgname}-git
pkgver=0.1.5.r0.gd0c20a6
pkgrel=1
pkgdesc='Blazing fast TUI launcher for GNU/Linux and *BSD (git version)'
arch=('any')
url="https://sr.ht/~nkeor/gyr"
license=('BSD-2-Clause')
makedepends=('rust' 'git')
provides=('gyr')
conflicts=('gyr')
source=("git+https://git.sr.ht/~nkeor/gyr")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd "${_pkgname}"
    cargo build --release
}

package() {
    cd "${_pkgname}"
    install -Dm755 "target/release/$_pkgname" \
        -t "$pkgdir/usr/bin"
}
