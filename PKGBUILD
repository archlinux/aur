# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Emanuele 'Lele' Calo
# Contributor: c0gnitivefl0w
# Contributor: Redpill13
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=seadrive-gui
pkgver=2.0.24
pkgrel=1
pkgdesc="GUI part of seadrive"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('Apache')
depends=('qt5-webengine' 'qt5-tools' 'seadrive-daemon')
makedepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4b4c56b2ccffe28b79bfa0ca958be1890c3714a259f6b5d21d4501694ef6246a')

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
