# Maintainer: fkzys <fkzys at proton dot me>
pkgname=dotm
pkgver=0.1.4
pkgrel=1
pkgdesc="Declarative dotfiles manager with normal file paths, delegated encryption, and first-class permission management"
arch=('x86_64')
url="https://github.com/fkzys/dotm"
license=('AGPL-3.0-or-later')
makedepends=('go')
optdepends=(
    'sops: secret decryption in templates'
    'age: key management for sops'
    'bash: script execution'
    'diffutils: dotm diff'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d5f8eeae9e791331949b96423a1ebb33e43b750a7b2442f24bba5ed032c4d397')

build() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="${srcdir}/gopath"
    export GOFLAGS="-mod=readonly -modcacherw"
    make build
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
