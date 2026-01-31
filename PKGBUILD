# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname="libxeddsa-git"
pkgver=r44.a9a2bb9
pkgrel=1
pkgdesc="A toolkit around Curve25519 and Ed25519 key pairs, with a focus on conversion between the two."
arch=("x86_64" "aarch64")
url="https://github.com/Syndace/libxeddsa"
license=("MIT")
depends=("glibc" "libsodium")
makedepends=("git" "cmake")
checkdepends=("cmake")
provides=("libxeddsa" "libxeddsa.so")
conflicts=("libxeddsa")
source=("${pkgname}::git+https://github.com/Syndace/libxeddsa.git")
sha256sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

check() {
    cd "${pkgname}"
    ctest
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}/" install/strip
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
