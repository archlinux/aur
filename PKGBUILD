_pkgname=kwin6-bismuth-decoration
pkgname=${_pkgname}-git
pkgver=r7.c2ba04d
pkgrel=1
pkgdesc='Bismuth window decoration for Plasma 6'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/HanabishiRecca/${_pkgname}"
license=('MIT')

depends=(
    'gcc-libs'
    'glibc'
    'kconfig'
    'kcoreaddons'
    'kdecoration'
    'qt6-base'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'git'
)

source=("git+${url}")
sha256sums=('SKIP')

_since='ef69afe69f615149ab347e4402862ee900452a65'

pkgver() {
    cd "${_pkgname}"
    printf 'r%s.%s' "$(git rev-list --count "${_since}..HEAD")" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -B 'build' -S "${_pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_LIBDIR=lib

    cmake --build 'build'
}

package() {
    DESTDIR="${pkgdir}" cmake --install 'build'
}
