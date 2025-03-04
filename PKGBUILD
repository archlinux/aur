# Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

pkgname=veesem-git
pkgver=r20.d25c8fb
pkgrel=1
pkgdesc='V.Smile emulator'
arch=('x86_64')
url='https://github.com/sp1187/veesem/'
license=('ISC')
depends=('gcc-libs' 'glibc' 'libglvnd' 'sdl2')
makedepends=('cmake' 'git')
provides=('veesem')
source=("git+https://github.com/sp1187/veesem.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake \
        -B build \
        -S "${pkgname%-git}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
