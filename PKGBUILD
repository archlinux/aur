# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Emanuele 'Lele' Calo
# Contributor: c0gnitivefl0w
# Contributor: Redpill13
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=seadrive-gui
pkgver=3.0.12
pkgrel=1
pkgdesc="GUI part of seadrive"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('Apache')
depends=('qt5-webengine' 'qt5-tools' 'seadrive-daemon' 'libsearpc')
makedepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('45dfba91deafd7074a448958b67e8d09866a01fc22b4ab454b06145fac02438f')

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
