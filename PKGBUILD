# Maintainer: Platon Pronko < platon7pronko at gmail dot com >
pkgname=mill-global
pkgver=1.1.5
pkgrel=1
pkgdesc="Mill Build Tool, global installation"
arch=("any")
url="https://github.com/com-lihaoyi/mill"
license=("MIT")

source=("https://repo1.maven.org/maven2/com/lihaoyi/mill-dist/${pkgver/_/-}/mill-dist-${pkgver/_/-}-mill.sh"
        "https://raw.githubusercontent.com/lefou/mill-bash-completion/dfd5ac9b8b0d08b0a22596e88f0f4b1d15abcfd4/mill.complete.sh")
sha256sums=('b04c98d6dface8ffdbf6c7f94aee68dae3d3309f2cab067989bb54159153db95'
            'bf293fbc521cc0c8108cbbc3580adc81cbf470380b4f5cd160af075a5f1214e0')

prepare() {
    cd "${srcdir}"
    # bash-completion renamed _split_longopt in version 2.12.0 (2024-02-21)
    sed -i 's/_split_longopt/_comp__split_longopt/' mill.complete.sh
}

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}/mill-dist-${pkgver/_/-}-mill.sh" "${pkgdir}/usr/bin/mill"
    install -Dm644 "${srcdir}/mill.complete.sh" "${pkgdir}/usr/share/bash-completion/completions/mill"
}
