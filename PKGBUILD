# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

_pkgname=rres
pkgname=${_pkgname}-git
pkgver=0.1.2.r0.g0180c36
pkgrel=1
pkgdesc='A xrandr replacement to gather display resolutions'
arch=('any')
url="https://gitlab.com/forkbomb9/rres"
license=('GPLv3')
makedepends=('rust')
provides=('rres')
conflicts=('rres')
source=("git+https://gitlab.com/forkbomb9/${_pkgname}.git")
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
