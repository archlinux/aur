# Maintainer: codeberge <concur_panama530 at slmail dot me>
pkgname=dl-distro-git
_pkgname=dl-distro
pkgver=29.c0fe50b
pkgrel=1
pkgdesc="Download and verify ISOs with GPG and shasums for a chosen distro"
arch=('any')
url="https://codeberg.org/codeberge/${_pkgname}"
license=('GPL3')
depends=('bash' 'curl' 'gnupg')
makedepends=('git')
source=("git+https://codeberg.org/codeberge/${_pkgname}.git")
validpgpkeys=('1ABE28A7568557DB148CB0F009126D8AD05FCD49')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"
    git verify-commit HEAD || return 1
    install -D -m755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
