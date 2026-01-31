# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname="libxeddsa"
pkgver=2.0.1
pkgrel=1
pkgdesc="A toolkit around Curve25519 and Ed25519 key pairs, with a focus on conversion between the two."
arch=("x86_64" "aarch64")
url="https://github.com/Syndace/libxeddsa"
license=("MIT")
depends=("glibc" "libsodium")
makedepends=("git" "cmake")
checkdepends=("cmake")
provides=("libxeddsa.so")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Syndace/libxeddsa/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("0bcca892dda9caaf725c82ae34f3ee7638395319b3bae380c22d9851c046bb8f")

build() {
    cd "${pkgname}-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

check() {
    cd "${pkgname}-${pkgver}"
    ctest
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install/strip
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
