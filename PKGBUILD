# Maintainer: fkzys <fkzys at proton dot me>
pkgname=dotm
pkgver=0.1.4
pkgrel=1
pkgdesc="Declarative dotfiles manager with normal file paths, delegated encryption, and first-class permission management"
arch=('x86_64')
url="https://gitlab.com/fkzys/dotm"
license=('AGPL-3.0-or-later')
makedepends=('go')
optdepends=(
    'sops: secret decryption in templates'
    'age: key management for sops'
    'bash: script execution'
    'diffutils: dotm diff'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('2750ac85c845be65c242764a4597bddc8222d4c37d728aa85c184829a5433727')

build() {
    cd "${pkgname}-v${pkgver}"
    export GOPATH="${srcdir}/gopath"
    export GOFLAGS="-mod=readonly -modcacherw"
    make build
}

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
