# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

_pkgname=gyr
pkgname=${_pkgname}-git
pkgver=0.1.0.r0.g7901ce7
pkgrel=1
pkgdesc='Blazing fast TUI launcher for *BSD and Linux'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~forkbomb9/gyr"
license=('BSD-2-Clause')
makedepends=('rust' 'git')
provides=('gyr')
conflicts=('gyr')
source=("git+https://git.sr.ht/~forkbomb9/gyr")
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
    strip "target/release/$_pkgname"
    install -Dm755 "target/release/$_pkgname" \
        -t "$pkgdir/usr/bin"
}
