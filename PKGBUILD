# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=qtextpad
pkgdesc="Lightweight cross-platform text editor using KF5's syntax highlighting repository."
pkgver=1.10
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/zrax/qtextpad'
license=('GPL3')
depends=('syntax-highlighting')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        force_qt5.patch)
sha256sums=('31173a2f19e7ad6db1f0a610f449e19a27e4399620e7f9480c249e30d3fd55ec'
            'f4c20348814fef477bace4cd575aab0e90373635fbb7720f804ab8c5bac73ed0')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # KSyntaxHighlighting only supports Qt5 in Arch for now...
    patch -p1 -i "${srcdir}/force_qt5.patch"
}

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
