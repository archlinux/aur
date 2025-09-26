# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=lekhika-trainer-git
_pkgname=lekhika-trainer
pkgdesc='Database editor tester application for liblekhika library '
pkgver=r2.445f514
pkgrel=2
arch=(x86_64)
url="https://github.com/khumnath/lekhika-trainer"
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'liblekhika' 'qt6-base' 'sqlite' 'icu')
makedepends=('git' 'cmake' 'extra-cmake-modules')
optdepends=('gettext' 'appstream')
license=('GPL-3.0-only')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=(lekhika-trainer)
conflicts=(lekhika-trainer lekhika-trainer-bin)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${_pkgname}"
    DESTDIR="$pkgdir" cmake --install build
}
