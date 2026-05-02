# Maintainer: Daniel <6887-danielfrrrr@users.noreply.gitlab.archlinux.org>

_pkgname=obs-kmscap
pkgname=obs-kmscap-git
pkgver=0
pkgrel=1
pkgdesc="A zero-copy screen capture plugin for OBS Studio on Linux"
url=https://github.com/xnqs/obs-kmscap
license=("GPL-2.0-or-later")
install=obs-kmscap-git.install
source=("git+https://github.com/xnqs/obs-kmscap")
cksums=("SKIP")
arch=("x86_64")
depends=("libdrm" "obs-studio")
makedepends=("cmake" "git")
conflicts=("obs-kmscap")
provides=("obs-kmscap")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -B build -D CMAKE_BUILD_TYPE=None -D CMAKE_INSTALL_LIBEXECDIR=lib -D CMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}"
    DESTDIR="${pkgdir}" cmake --install build
}
