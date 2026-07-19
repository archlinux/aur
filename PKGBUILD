# Maintainer : ammarsyamil057@gmail.com

pkgname=hyprlarp
pkgver=0.1.0
pkgrel=1
pkgdesc="Hyprland terminal video viewer with dynamic layout, multi terminal video canvas for Kitty terminals"
arch=('x86_64')
url="https://github.com/AmmarSyamil/HyprLarp"
license=('MIT')
depends=(
    'qt5-base'
    'ffmpeg'
    'opencv'
    'simdjson'
    'nlohmann-json'
    'hyprland'  
    'kitty'     
)
makedepends=(
    'cmake'
    'git'
    'base-devel'
    'qt5-tools'   
    'pkg-config'
)
optdepends=()
provides=("${pkgname}")
conflicts=()
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' || echo "0.0.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_FLAGS="-O2 -march=x86-64 -pipe"
    make
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make DESTDIR="${pkgdir}" install
}