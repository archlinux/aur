# Maintainer: SEGFAULT <segfault@mailbox.org>
pkgname=jackctl-git
pkgver=0.0.0.47
pkgrel=1
pkgdesc='A no fuss solution to wrangling Pro-Audio on Linux'
arch=('any')
url='https://gitlab.com/IGBC/jackctl'
license=('GPL3')
depends=('gtk3' 'jack2' 'libappindicator-gtk3')
makedepends=('git' 'rust' 'gtk3' 'cmake' 'make' 'clang')
provides=('jackctl')
conflicts=('jackctl')
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "0.0.0.r%s" "$(git rev-list --count HEAD)"
}

build () {
    cd "${srcdir}/${pkgname}"
    export CARGO_HOME="${srcdir}/${pkgname}/CARGO"
    cargo build --release
}

package() {
  install -Dm644 ${srcdir}/${pkgname}/LICENSE.txt ${pkgdir}/usr/share/licenses/jackctl/LICENSE
    install -Dm755 ${srcdir}/${pkgname}/target/release/jackctl ${pkgdir}/usr/bin/jackctl
}
