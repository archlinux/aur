pkgname=kwin-effects-yet-another-magic-lamp-reloaded-git
pkgver=6.6.r23.gf6dbfcf
pkgrel=1
pkgdesc="Fork of Yet Another Magic Lamp, targeting Plasma 6.8+ with exclusive Wayland support"
arch=('x86_64')
url="https://github.com/koryboc/kwin-effects-yet-another-magic-lamp-reloaded"
license=('GPL-2.0-only')
depends=(
    'kwin'
    'kconfig'
    'kconfigwidgets'
    'kcmutils'
    'kcoreaddons'
    'kwindowsystem'
    'qt6-base'
    'libdrm'
    'vulkan-headers'
)
makedepends=('cmake' 'extra-cmake-modules' 'git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --match "[0-9]*" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
