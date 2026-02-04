# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: javalsai <javalsai@proton.me>

_pkgname=lidm
pkgname=${_pkgname}-git
pkgver=2.0.0.r0.g978aaad
pkgrel=1
depends=('pam' "${_pkgname}-service")
makedepends=('git')
pkgdesc="A fully colorful customizable TUI display manager made in C. (git vcs)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/javalsai/lidm")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --long --abbrev=7 --tags | \
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_pkgname}"
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
