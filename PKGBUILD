# Maintainer: initMayday <initMayday@protonmail.com>
# Contributor: Hoream <hoream@qq.com>

_pkgname=cuarzo
pkgname="$_pkgname-git"
pkgver=r8.51c3759
pkgrel=1
pkgdesc="The Cuarzo Framework"
arch=('any')
url="https://github.com/CuarzoSoftware/Cuarzo"
license=('MIT')
#> I am aware this is not exhaustive - please contribute new dependencies as you run into them
depends=('libglvnd' 'libdrm' 'mesa' 'libdisplay-info' 'libinput' 'seatd' 'glibc' 'systemd-libs' 'boost' 'yoga' 'vulkan-headers')
makedepends=('git' 'meson' 'ninja')
optdepends=()
provides=("cz-core"
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
