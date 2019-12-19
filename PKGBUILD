# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>
# Contributor: Olaf Leidinger <oleid@mescharet.de>

pkgname=futhark-nightly
pkgver=0.14.0.rf13eb89
pkgrel=1
pkgdesc="A data-parallel functional programming language"
arch=('x86_64')
url="https://github.com/diku-dk/futhark"
license=('ISC')
depends=('ncurses5-compat-libs'
         'zlib'
         'gmp')
optdepends=('opencl-headers: opencl support'
            'ocl-icd: opencl support'
            'opencl-driver: opencl support')
makedepends=()
provides=("${pkgname%-nightly}")
conflicts=("${pkgname%-nightly}")
source=("${pkgname}-$(date -u +%Y%m%d%H).tar.xz::https://futhark-lang.org/releases/futhark-nightly-linux-${arch}.tar.xz")
sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/futhark-nightly-linux-${arch}"
    printf "%s.r%s" "$(./bin/futhark -V | grep Futhark | sed "s/Futhark //")" "$(cat commit-id)"
}

package() {
    cd "${srcdir}/futhark-nightly-linux-${arch}"
    make PREFIX="${pkgdir}/usr" install

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
