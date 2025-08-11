# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=pam-parallel
pkgver=1.0.0
pkgrel=1
pkgdesc='A PAM module that runs multiple other PAM modules in parallel, succeeding as long as one of them succeeds'
arch=('i686' 'x86_64')
url="https://github.com/FuriLabs/pam-parallel"
depends=('jansson' 'pam')
makedepends=('make' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/furios/trixie/${pkgver}.tar.gz")
b2sums=('627e3d3ac87d85df1a90a9bfa3d27c0586eb2addaa5bcf09d54fbfcea67928e54f1293f9e024e723568d2bf77ba88de5786dc1bb072be9f73d4554e2e54223a3')

_pkgsrcdir="${pkgname}-furios-trixie-${pkgver}"

prepare() {
    cd "${srcdir}"
    tar -xvf "${srcdir}/${pkgname}-${pkgver}.tar.gz"
    cd "${srcdir}/${_pkgsrcdir}"
}

build() {
    cd "${srcdir}/${_pkgsrcdir}"
    make
}

package() {
    cd "${srcdir}/${_pkgsrcdir}"

    install -d "${pkgdir}/usr/lib/security/"
    install -m 0755 pam_parallel.so "${pkgdir}/usr/lib/security/"
}
