# Maintainer: Dae Euhwa <daedaevibin@naver.com>
pkgname=voix
pkgver=2.0.0
pkgrel=1
install=voix.install
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0' 'AGPL-3.0-or-later' 'VCL-1.0')
depends=('pam')
makedepends=('cmake>=3.18' 'gcc' 'make' 'pkgconf')
backup=('etc/pam.d/voix' 'etc/voix.conf')
source=("git+https://github.com/Veridian-Zenith/Voix.git")
sha256sums=('SKIP')

pkgver() {
    # simply return the static version set at the top of this PKGBUILD
    echo "$pkgver"
}

prepare() {
    cd Voix
    # Verify CMakeLists.txt exists
    test -f CMakeLists.txt || return 1
}

build() {
    cd Voix
    cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_COMPILER=clang++
    cmake --build build --parallel
}

package() {
    cd Voix/build
    cmake --install . --prefix "${pkgdir}/usr"
}
