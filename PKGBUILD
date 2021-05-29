# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=box86
pkgver=0.2.2
pkgrel=1
pkgdesc='Linux Userspace x86 Emulator with a twist'
arch=('armv7h')
url='https://github.com/ptitSeb/box86'
license=('MIT')
depends=('gcc-libs')
optdepends=('gl4es: OpenGL 2 for GLES 2 devices')
makedepends=('git' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ptitSeb/box86/archive/v${pkgver}.tar.gz")
sha256sums=('24984dcdef8bbd164da6b2f727087f2df5dd54b568749b16efe3f51a0ce08838')

build() {
  cd ${pkgname}-${pkgver}
  cmake -B build -S . \
        -DARM_DYNAREC=ON \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
  install -Dm644 ../docs/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

