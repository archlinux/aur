# Maintainer: Namkhai B. <echo em.roekn@kn | rev>

_pkgname=rres
pkgname=${_pkgname}-git
pkgver=0.1.5.r0.g33e5e87
pkgrel=1
pkgdesc='A xrandr replacement to gather display resolutions'
arch=('any')
url="https://sr.ht/~nkeor/rres"
license=('GPLv3')
makedepends=('rust')
provides=('rres')
conflicts=('rres')
source=("git+https://git.sr.ht/~nkeor/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd ${_pkgname}
    cargo build --release
}

package() {
    cd ${_pkgname}
    install -Dm755 "target/release/${_pkgname}" \
        -t "${pkgdir}/usr/bin"
}
