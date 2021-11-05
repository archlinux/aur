# Maintainer: Gustavo Alvarez Lopez <sl1pkn07@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Score_Under <seejay.11@gmail.com>

pkgname=xnp2
pkgver=0.86
pkgrel=3
pkgdesc="X Neko Project II, a PC-9801 emulator"
arch=('x86_64')
url='http://www.nonakap.org/np2'
license=('BSD')
depends=('gtk2'
         'sdl2_mixer'
         'libsm'
         )
source=("http://www.nonakap.org/np2/release/xnp2-${pkgver}.tar.bz2"
        'patch.patch'
        )
sha256sums=('e0b8c93f54682a4b3373907fd9ffe78094f95f7430dffc5038eccbcc4c3f78fd'
            '77b52b2832a9fc3ef8e71ccf85e5e04580247e80e4d973f46f71adc409df99c6'
            )

prepare() {
  mkdir -p build

  patch -d "xnp2-${pkgver}" -p1 -i "${srcdir}/patch.patch"

  cd build
  "../xnp2-${pkgver}/x11/configure" \
    --prefix=/usr \
    --enable-build-all \
    --enable-ia32
    #--enable-gtk3
}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}/" install
}
