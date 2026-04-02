# Maintainer: fa5e4658010be730
pkgname=dotm
pkgver=0.1.2
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
sha256sums=('1bcda26b9cee5652e5436d3c63398e5c7b31fde5b7496918b159d52eb95641ab')

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
