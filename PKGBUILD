# Maintainer: 13thfloorelevators <the13thfloorelevators@protonmail.com> <BURST-737A-XKSG-M424-67UVT>

pkgname=engraver-git
_realname=engraver
_realname2=plot64
pkgver=2.20
pkgrel=1
pkgdesc="PoCC reference plotter for BURST"
arch=(x86_64)
url="https://github.com/PoC-Consortium/engraver"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
options=('strip' '!emptydirs')
source=("git+https://github.com/PoC-Consortium/${_realname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_realname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "${srcdir}/${_realname}"
        cargo build --release
}

check() {
    cd "${srcdir}/${_realname}"
    cargo test
}

package() {
        cd "${srcdir}/${_realname}/target/release"
        install -Dm755 "${_realname}" "${pkgdir}/usr/bin/${_realname}"
}


