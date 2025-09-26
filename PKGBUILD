# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=liblekhika-git
_pkgname=liblekhika
pkgdesc='Lekhika library for Latin to Nepali Devnagari transliteration.'
pkgver=r6.a6e0eaf
pkgrel=1
arch=(x86_64)
url="https://github.com/khumnath/liblekhika"
depends=('gcc-libs' 'glibc' 'sqlite' 'icu')
makedepends=('git' 'cmake' 'ninja')
license=('GPL-3.0-only')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=(liblekhika)
conflicts=(liblekhika liblekhika-bin)
pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    export CXXFLAGS+=" -DLEKHIKA_SRC_DIR=\\\"/usr/share/liblekhika\\\""
    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${_pkgname}"
    DESTDIR="$pkgdir" cmake --install build
}
