# Maintainer:
# Contributor: Alexander Fetting <deeznuts420692@proton.me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=simgear
pkgver=2024.1.6
pkgrel=1
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications"
arch=('x86_64')
url="https://gitlab.com/flightgear/simgear"
license=('LGPL-2.0-only')
depends=('c-ares' 'curl' 'expat' 'ffmpeg' 'glibc' 'libgcc' 'libglvnd' 'libstdc++' 'openal' 'openscenegraph' 'xz' 'zlib')
makedepends=('boost' 'boost-libs' 'cmake')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('34d3cca4c11a44e55115f2f5f23878b20d1fd44f1ce51657825efda566cc79b9')

build() {
    local cmake_options=(
        -B build
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D ENABLE_TESTS=OFF
        -D SIMGEAR_SHARED=ON
        -D SYSTEM_EXPAT=ON
        -D SYSTEM_UDNS=ON
        -S "${pkgname}-${pkgver}"
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
