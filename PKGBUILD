# Maintainer:
# Contributor: Alexander Fetting <deeznuts420692@proton.me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=simgear
pkgver=2024.1.5
pkgrel=1
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications"
arch=('x86_64')
url="https://gitlab.com/flightgear/simgear"
license=('LGPL-2.0-only')
depends=('c-ares' 'curl' 'expat' 'ffmpeg' 'glibc' 'libgcc' 'libglvnd' 'libstdc++' 'openal' 'openscenegraph' 'xz' 'zlib')
makedepends=('boost' 'boost-libs' 'cmake')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b396b53825a2d7dad1619800598dbd535fd93ad983379fe60d14532151592c69')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D SIMGEAR_SHARED=ON \
        -D SYSTEM_EXPAT=ON \
        -D SYSTEM_UDNS=ON
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
