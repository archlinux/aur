# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Emanuele 'Lele' Calo
# Contributor: c0gnitivefl0w
# Contributor: Redpill13
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=seadrive-gui
pkgver=2.0.23
pkgrel=1
pkgdesc="GUI part of seadrive"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('Apache')
depends=('qt5-webengine' 'qt5-tools' 'seadrive-daemon')
makedepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('604793ff41bb8d20bbabf6a9fcec839a387fae9480a4d61f163c73cbbe0413ce')

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
