# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=fcitx5-lekhika-git
_pkgname=fcitx5-lekhika
pkgdesc='Nepali input method engine for fcitx5.'
pkgver=r83.cea471a
pkgrel=2
arch=(x86_64)
url="https://github.com/khumnath/fcitx5-lekhika"
depends=('gcc-libs' 'glibc' 'fcitx5' 'fcitx5-qt' 'hicolor-icon-theme' 'liblekhika' 'sqlite' 'icu')
makedepends=('git' 'cmake' 'ninja')
optdepends=('lekhika-trainer: Manage Dictionary database for lekhika')
license=('GPL-3.0-only')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=(fcitx5-lekhika)
conflicts=(fcitx5-lekhika fcitx5-lekhika-bin)

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
