# Maintainer: Lucas Schwiderski <lucas@lschwiderski.de>
pkgname=kdegraphics-thumbnailer-dds-git
pkgver=r31.4e791fa
pkgrel=2
epoch=
pkgdesc="DDS texture thumbnailer for KDE"
arch=("x86_64")
url="https://github.com/xmaciek/kdegraphics-thumbnailer-dds"
license=('MIT')
groups=()
depends=('qt6-base' 'kio' 'kcoreaddons')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=('kdegraphics-thumbnailer-dds')
conflicts=('kdegraphics-thumbnailer-dds')
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "${pkgname%-git}::git+${url}.git"
    "isValid_undefined.patch"
)
noextract=()
sha256sums=('SKIP'
            'b93847aaef92eb605ae25e7aa13094f3879eeeabc2d3b1d75b76c4923926586c')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    patch -p1 -i "$srcdir/isValid_undefined.patch"
}

build() {
    cmake \
        -S "${pkgname%-git}" \
        -B "${pkgname%-git}/build" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build "${pkgname%-git}/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "${pkgname%-git}/build"
}
