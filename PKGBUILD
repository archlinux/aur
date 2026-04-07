# Maintainer: Sougato Chakrobortty <someonesomething800@gmail.com>
pkgname=cysinfo-git
_pkgname=cysinfo
pkgver=3.0
pkgrel=1
pkgdesc="A super simple and minimal fetch tool."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/Charged/cysinfo.git"
license=('ISC')
depends=()
makedepends=(git make gcc)
provides=(cysinfo)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "3.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    make
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
    install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
}
