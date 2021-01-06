# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=copperspice
pkgver=1.7.0
pkgrel=1
pkgdesc='Libraries for developing cross platform software applications in C++'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('LGPL2.1')
depends=('cups' 'fontconfig' 'glib2' 'gstreamer' 'gst-plugins-base-libs' 'libgl'
         'libice' 'libpulse' 'libsm' 'libx11' 'libxcb' 'libxi' 'libxkbcommon'
         'libxkbcommon-x11' 'openssl' 'xcb-util-keysyms' 'xcb-util-image'
         'xcb-util-renderutil' 'xcb-util-wm' 'zlib')
optdepends=('mariadb-libs: for MySQL database support'
            'postgresql-libs: for PostgreSQL database support')
makedepends=('cmake' 'alsa-lib' 'mariadb-libs' 'postgresql' 'postgresql-libs'
             'libxcursor' 'libxext'  'libxfixes' 'libxinerama' 'libxrandr'
             'libxrender' 'libxml2')
conflicts=('qt5-tools')
source=("https://github.com/copperspice/copperspice/archive/cs-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5450da1968172df91a7b54101ddbcc385d9cc4ea6a007bcb500e92f34849fb9f')

build() {
    cmake -B build -S "copperspice-cs-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
