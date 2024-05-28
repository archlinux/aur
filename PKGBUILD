# Maintainer: Zack Didcott

pkgname=dtdump-git
pkgver=r6.0877b52
pkgrel=1
pkgdesc="Dump non-encrypted iOS device tree extracted from im4p."
arch=("any")
url="https://github.com/freedomtan/iOS-device-tree-dump"
license=("BSD-3-Clause")
optdepends=("img4lib-git: handle img4 files")
provides=("dtdump")
conflicts=("dtdump")
source=("${pkgname}::git+https://github.com/freedomtan/iOS-device-tree-dump.git")
b2sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${pkgname}"
    make all
}

package() {
    cd "${pkgname}"
    install -Dm755 "dtdump" "${pkgdir}/usr/bin/dtdump"
}