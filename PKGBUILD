# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Lamelos <lamelos at gmail.com>

pkgname=butane
pkgver=0.27.0
pkgrel=1
pkgdesc="Human readable Butane Configs into machine readable Ignition Configs Translator"
arch=("any")
url="https://github.com/coreos/butane"
license=("Apache-2.0")
makedepends=("git" "go" "make")
source=("git+${url}.git#tag=v${pkgver}"
        "change-bin-dir.patch")
sha256sums=('e0af0d96d8a6e24941f99903cca5b70f1d732a26cec8a4d7e7235c703a58975e'
            'bdb99494bf163a89269858f2aeb28b389837e9eb0b92b7b2c20e5a03f4941cde')

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
