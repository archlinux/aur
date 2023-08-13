# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=jq.sh
pkgname=$_pkgname-git
pkgver=1.0.0.r0.g769f5d7
pkgrel=1
pkgdesc='jq-in-shell integration library'
arch=('any')
url='https://git.stefanwimmer128.eu/stefanwimmer128/jq.sh'
license=('MPL2')
depends=('sh' 'jq' 'moreutils')
makedepends=('git' 'shellcheck' 'shellspec' 'getoptions')
optdepends=('yq: Adds support for yq, xq and tomlq')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://git.stefanwimmer128.eu/stefanwimmer128/jq.sh.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"

    make
}

check() {
    cd "$_pkgname"

    make check
}

package() {
    cd "$_pkgname"

    make DESTDIR="$pkgdir" PREFIX=/usr install
}
