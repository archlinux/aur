# Maintainer: fa5e4658010be730
pkgname=dotm
pkgver=0.1.3
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
sha256sums=('8ec2a5d535d5814a5d299c4a997ca1002df6b6a38fd1e9c885e058d703197f63')

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
