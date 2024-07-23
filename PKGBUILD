# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=jq.sh
pkgname=$_pkgname-git
pkgver=1.0.1.r8.g5b1f040
pkgrel=1
pkgdesc='jq-in-shell integration library'
arch=('any')
url='https://gitlab.com/stefanwimmer128/jq.sh'
license=('MPL2')
depends=('sh' 'jq' 'moreutils')
makedepends=('git' 'shellcheck' 'shellspec' 'getoptions')
optdepends=('yq: Adds support for yq, xq and tomlq')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://gitlab.com/stefanwimmer128/jq.sh.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"

    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"

    ./bootstrap
    ./configure --prefix=/usr
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

    make DESTDIR="$pkgdir" install
}
