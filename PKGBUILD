# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=fcct_test_do_not_use
pkgver=0.4.1
pkgrel=1
pkgdesc="Fedora CoreOS Config Transpiler"
arch=("any")
url="https://github.com/coreos/fcct"
license=("Apache")
makedepends=("git" "go" "make")
source=("git+${url}.git#tag=v${pkgver}"
        "change-bin-dir.patch")
sha256sums=('SKIP'
            'a26cbc75fba1872a0213fac07d46650c3a2854913205695402f41232faeeeda5')

prepare() {
    cd "${srcdir}"
    patch --forward --strip=1 --input="${srcdir}/change-bin-dir.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    ./build
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m 755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
