# Maintainer: detiam <dehe_tian@outlook.com>

_pkgname=pgp2ssh
pkgname=pgp2ssh-git
pkgver=r26.815c00d
pkgrel=1
pkgdesc="Convert PGP/GPG private keys to SSH private keys"
arch=(x86_64)
url="https://github.com/pinpox/$_pkgname"
license=('MIT')

provides=("$_pkgname")
conflicts=("$_pkgname")
#replaces=("$_pkgname")
makedepends=('go' 'git')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

#prepare() {
#    cd "$_pkgname"
#}

build() {
    cd "$_pkgname"
    GOPATH="${srcdir}"
    go build
    go clean --modcache
}

package() {
    cd "$_pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
