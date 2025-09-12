# SPDX-License-Identifier: 0BSD
# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=obs-wayland-hotkeys-git
pkgver=r9.e77f8b6
pkgrel=1
pkgdesc="OBS Studio plugin that implements the global shortcuts portal"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/leia-uwu/obs-wayland-hotkeys"
license=('GPL-2.0-or-later')

depends=('obs-studio')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=('git+https://github.com/leia-uwu/obs-wayland-hotkeys.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/obs-wayland-hotkeys"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake \
        -S "${srcdir}/obs-wayland-hotkeys" \
        -B "${srcdir}/${pkgname}-build" \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr

    cmake --build "${srcdir}/${pkgname}-build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "${srcdir}/${pkgname}-build"
}
