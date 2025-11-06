# Maintainer:
# Contributor: Alexander Fetting <deeznuts420692@proton.me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=simgear
pkgver=2024.1.3
pkgrel=1
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications"
arch=('x86_64')
url="https://gitlab.com/flightgear/simgear"
license=('LGPL-2.0-only')
depends=('c-ares' 'curl' 'expat' 'ffmpeg' 'gcc-libs' 'glibc' 'libglvnd' 'openal' 'openscenegraph' 'xz' 'zlib')
makedepends=('boost' 'cmake')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('da61be519cc8942f9bedec9a32623bb2357bfaa4d55a59c9c8c8991deb35d20f')

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
