# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=qtextpad
pkgdesc="Lightweight cross-platform text editor using KF6's syntax highlighting repository."
pkgver=1.12
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/zrax/qtextpad'
license=('GPL3')
depends=('syntax-highlighting')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b43d54625b060fedd14fb6c66056586a3f68beed699bbc90c0bced6e7492dd05')

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DQT_VERSION_MAJOR=6 \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
