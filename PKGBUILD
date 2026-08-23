# Maintainer: Roice Young <dekodx@proton.me>
_pkgname=steam-overlay-wayland
pkgname=$_pkgname-git
pkgver=4ca1566
pkgrel=1
pkgdesc='Vulkan layer that provides a bridge between wayland native applications and the steam overlay'
arch=('x86_64')
url='https://github.com/GloriousEggroll/proton-ge-custom/'
license=('BSD-3-Clause')
depends=('vkroots-git')
makedepends=('git' 'cmake' 'vulkan-headers')
source=("$_pkgname::git+https://github.com/DekoDX/ge-steam-overlay-wayland.git") # Avoid cloning all of proton-ge for convenience
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --always --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    cmake \
        -DVKROOTS_INCLUDE_DIR="/usr/include" \
        -DVULKAN_HEADERS_INCLUDE_DIR="/usr/include" \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -B build

    cmake --build build
}

package() {
    cd "$_pkgname"
    cmake --install build
}
