# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>

_name=hdr-image-viewer
pkgname="${_name}-git"
pkgver=r23.e17681c
pkgrel=3
pkgdesc="An application for viewing HDR images with accurate color reproduction"
arch=('x86_64')
url='https://github.com/aaron-rust/hdr-image-viewer'
license=('MIT')
depends=(
    'qt6-base' 
    'qt6-declarative' 
    'qt6-wayland' 
    'kirigami'
    'kconfig' 
    'kcoreaddons'
    'ki18n'
    'unixodbc'
    'libjxl'
)
makedepends=(
    'base-devel'
    'cmake'
    'extra-cmake-modules'
    'ccache'
    'qt6-doc'
)
provides=("$_name")
conflicts=("$_name")
source=(
    "$_name::git+https://github.com/aaron-rust/hdr-image-viewer.git"
    "$_name.desktop"
)
sha256sums=(
    'SKIP'
    '718d0de089c9668b74e5661bf3a0f180857a10055ccc7ddddc084f56790ee6fb'
)

pkgver() {
    cd "$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S "$_name" -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$_name/resources/app-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
    install -Dm644 "$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
    install -Dm644 "$_name/LICENSE.md" "$pkgdir/usr/share/licenses/$_name/LICENSE.md"
}