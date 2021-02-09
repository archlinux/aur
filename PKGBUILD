# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=authy-export-git
_bin=authy-export
_gitname=authy
pkgver=64ee05f
pkgrel=2
pkgdesc='Export your TOTP secret tokens from Authy.'
arch=('x86_64')
url="https://github.com/alexzorin/authy"
license=('MIT')
makedepends=('go')
optdepends=('qrencode: Import tokens into a mobile app. Please check the README.')
source=("git+${url}.git")
sha256sums=('SKIP')


prepare(){
    cd ${srcdir}/${_gitname}
    go get -v -d
}

build() {
    cd ${srcdir}/${_gitname}
    go build \
        -buildmode=pie \
        -trimpath \
        -mod=readonly \
        -modcacherw \
        -v -o $_bin cmd/authy-export/authy-export.go
}

package() {
    cd ${srcdir}/${_gitname}
    install -Dm755 $_bin "${pkgdir}/usr/bin/${_bin}"
    mkdir -p "${pkgdir}/usr/share/doc/${_bin}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_bin}/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${_bin}/"
}
