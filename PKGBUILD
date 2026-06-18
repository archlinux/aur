# Maintainer: devome <evinedeng@hotmail.com>

_reponame="kuake_cli"
_cmdname="kuake"
pkgname="${_reponame//_/-}"
pkgver=1.5.0
pkgrel=1
pkgdesc="Quark Cloud Drive File Management CLI Tool"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/zhangjingwei/${_reponame}"
license=("AGPL-3.0-or-later")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e0af1919d39846ec7bc5f6bcf8b95f1987412812f776fa3f8361550c787caf7d')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${_reponame}-${pkgver}"
    go build -ldflags="-s -w" -o "${_cmdname}" ./cmd
}

package() {
    cd "${_reponame}-${pkgver}"
    install -Dm755 "${_cmdname}" "${pkgdir}/usr/bin/${_cmdname}"
}
