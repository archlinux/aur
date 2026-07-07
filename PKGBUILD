# Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

pkgname=veesem-git
pkgver=0.2.r0.g42fb8f0
pkgrel=1
pkgdesc='V.Smile emulator'
arch=('x86_64')
url='https://github.com/sp1187/veesem/'
license=('ISC')
depends=('dbus' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd' 'libstdc++' 'sdl2' 'xdg-desktop-portal')
makedepends=('cmake' 'git')
provides=('veesem')
conflicts=('veesem')
source=("git+https://github.com/sp1187/veesem.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake \
        -B build \
        -S "${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
