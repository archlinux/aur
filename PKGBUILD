# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=jq.sh
pkgname=$_pkgname-git
pkgver=2.0.0.r0.g95d9fa4
pkgrel=1
pkgdesc='jq-in-shell integration library'
arch=('any')
url='https://gitlab.com/stefanwimmer128/jq.sh'
license=('MPL2')
depends=('sh' 'jq' 'moreutils')
makedepends=('git' 'getoptions-ng' 'yq')
checkdepends=('shellcheck' 'shellspec')
optdepends=('yq: Adds support for yq, xq and tomlq')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname" || return
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname" || return
    ./bootstrap
    ./configure --prefix=/usr
}

build() {
    cd "$_pkgname" || return
    make
}

check() {
    cd "$_pkgname" || return
    make check
}

package() {
    cd "$_pkgname" || return
    make DESTDIR="$pkgdir" install
}
