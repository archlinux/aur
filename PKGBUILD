# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=waybar-mpris-git
_pkgname=waybar-mpris
pkgver=r29.937769e
pkgrel=1
pkgdesc='MPRIS2 waybar component'
arch=('any')
url="https://git.hrfee.pw/hrfee/$_pkgname"
license=('unknown')
depends=()
makedepends=('go')
source=(git+$url)
md5sums=(SKIP)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$_pkgname"
    go build
}

package() {
    cd "$_pkgname"
    install -vDm 755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
