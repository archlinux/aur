# Maintainer: wyf9661 <aur at wyf9661 dot com>

pkgname=garble-git
_pkgname=garble
pkgver=0.14.2.r12.gbe4462
pkgrel=1
pkgdesc="Obfuscate Go builds"
arch=('x86_64')
url="https://github.com/burrowers/${_pkgname}"
license=('BSD3')
makedepends=('go')
provides=("${_pkgname}")
source=(git+${url}.git)
sha1sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --tags --abbrev=6 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build .
}

package() {
    cd "${_pkgname}"
    install -Dm755 "${_pkgname}" ${pkgdir}/usr/bin/${_pkgname}
}
