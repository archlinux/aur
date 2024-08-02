_pkgname=kwin6-bismuth-decoration
pkgname=${_pkgname}-git
pkgver=r4.603f3cc
pkgrel=1
pkgdesc='Tiling-WM-like window decorations for KWin'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/ivan-cukic/${_pkgname}"
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
    'kcmutils'
    'kconfigwidgets'
    'kdeclarative'
    'kglobalaccel'
    'qt6-svg'
)

source=("git+${url}")
sha256sums=('SKIP')

_since='ef69afe69f615149ab347e4402862ee900452a65'

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count "${_since}..HEAD")" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -B 'build' -S "${_pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib

    cmake --build 'build'
}

package() {
    DESTDIR="${pkgdir}" cmake --install 'build'
}
