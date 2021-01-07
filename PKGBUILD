# Maintainer: Michael Riegert <michael at eowyn net>

pkgname='blflash-git'
_pkgname='blflash'
pkgver=0.3.0.0.gb0967e7
pkgrel=1
pkgdesc='BL602 serial flasher'
arch=('x86_64')
url=https://github.com/spacemeowx2/blflash
license=('MIT')
depends=('cargo')
provides=('blflash')
conflicts=('blflash')
source=("${pkgname}"::git+${url})
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/-/./g;s/v//g'
}

build(){
    cd "${pkgname}"
    cargo build --release --target-dir=target
}

package() {
    cd "${pkgname}"
    install -Dm644 LICENSE-MIT "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
    install -Dm755 target/release/${_pkgname} ${pkgdir}/usr/bin/${pkgname}
}
