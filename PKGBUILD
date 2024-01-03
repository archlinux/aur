# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=linphone-plugin-msamr
_pkgname=msamr
pkgver=1.1.4
pkgrel=1
pkgdesc="Mediastreamer2 plugin for AMR codec"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL3')
depends=('mediastreamer'
    'opencore-amr'
    'ortp')
makedepends=('cmake' 'git')
source=("git+https://gitlab.linphone.org/BC/public/msamr.git#commit=cd61e46066c8c6004801158269adb8be326f7fde")
sha256sums=('SKIP')

build() {
    cmake -B build -S "$_pkgname" \
        -DCMAKE_PREFIX_PATH="/usr" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DBUILD_SHARED_LIBS="YES" \
        -Wno-dev
    make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}
