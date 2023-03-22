# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Emanuele 'Lele' Calo
# Contributor: c0gnitivefl0w
# Contributor: Redpill13
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=seadrive-gui
pkgver=2.0.27
pkgrel=1
pkgdesc="GUI part of seadrive"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('Apache')
depends=('qt5-webengine' 'qt5-tools' 'seadrive-daemon')
makedepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('703870022ba4dd0cf37df2e2288d7bf7af2fcc4a99423195fd550207007b5307')

prepare() {
    # Create build dir
    rm -rf build
    mkdir -p build
}

build () {
    # Build seadrive-gui
    cd "$srcdir/build"
    cmake \
        -Wno-dev \
        -DBUILD_SPARKLE_SUPPORT=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "${srcdir}/${pkgname}-${pkgver}"
    make
}

package () {
    # Install seadrive-gui
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
