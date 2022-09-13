# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

_pkgname=gyr
pkgname=${_pkgname}-git
pkgver=0.1.2.r0.gb0ffa0d
pkgrel=1
pkgdesc='Blazing fast TUI launcher for GNU/Linux and *BSD (git version)'
arch=('any')
url="https://sr.ht/~f9/gyr"
license=('BSD-2-Clause')
makedepends=('rust' 'git')
provides=('gyr')
conflicts=('gyr')
source=("git+https://git.sr.ht/~f9/gyr#branch=dev")
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
