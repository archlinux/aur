# Maintainer: Weitian Leung <weitianleung[at]gmail[dot]com>

pkgname=wms-git
_pkgver=1.0.0
pkgver=1.0.0.b770e05
pkgrel=1
pkgdesc="A tool for changing WPS Office language with online languages supports."
url="https://github.com/timxx/wms"
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base' 'desktop-file-utils' 'p7zip' 'polkit' 'wps-office')
makedepends=('cmake' 'qt5-tools')
source=("$pkgname::git+https://github.com/timxx/wms.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "${_pkgver}.%s" "$(git describe --always | sed 's/-/./g')"
}

prepare() {
    mkdir -p "${srcdir}/build"
}

build() {
    cd "${srcdir}/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        "${srcdir}/${pkgname}"

    make
}

package() {
    cd "${srcdir}/build"

    make DESTDIR="${pkgdir}" install
}
