# Maintainer: initMayday <initMayday@protonmail.com>
# Contributor: Hoream <hoream@qq.com>

_pkgname=cuarzo
pkgname="$_pkgname-git"
pkgver=r12.c504372
pkgrel=1
pkgdesc="The Cuarzo Framework"
arch=('any')
url="https://github.com/CuarzoSoftware/Cuarzo"
license=('MIT')
depends=(
    'libxkbcommon' #> cz-core, cz-kay, cz-louvre, cz-marco
    'wayland' #> everything, practically
    'libinput' #> cz-crystals, cz-louvre
    'libgl' #> cz-louvre, cz-skia
    'libegl' #> cz-louvre, cz-skia
    'libgles' #> cz-louvre, cz-ream, cz-skia
    'systemd-libs' #> cz-louvre, cz-srm
    'libxcursor' #> cz-louvre
    'libdrm' #> cz-louvre, cz-ream, cz-srm
    'seatd' #> cz-louvre
    #> [WARNING - cz-louvre also lists pthread and dl found by cpp]
    'boost' #> cz-ream
    'vulkan-icd-loader' #> cz-skia
    'harfbuzz' #> cz-skia
    'icu' #> cz-skia
    'fontconfig' #> cz-skia
    'freetype2' #> cz-skia
    'zlib' #> cz-skia
    'libpng' #> cz-skia
    'libwebp' #> cz-skia
    'libjpeg' #> cz-skia
    'libepoxy' #> cz-skia
    'spirv-tools' #> cz-skia
    'expat' #> cz-skia
    #> [WARNING - cz-skia also lists threads]
    'libdisplay-info' #> cz-srm
)
makedepends=('git' 'meson' 'ninja')
optdepends=()
provides=(
    "cz-core"
    "cz-crystals"
    "cz-kay"
    "cz-louvre"
    "cz-marco"
    "cz-marco"
    "cz-ream"
    "cz-skia"
    "cz-srm"
    "cz-xdgkit"
)
conflicts=()
replaces=()
options=()
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver () {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    mkdir -p build
    arch-meson build
    ninja -C build
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="${pkgdir}/" ninja -C build install
}
