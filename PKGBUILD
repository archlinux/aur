# Contributor: taotieren <admin@taotieren.com>

pkgname=durian-ocr-git
srcname=durian-ocr
pkgver=1.0.0.r0.gbf3d466
pkgrel=1
pkgdesc=" durian-ocr is no dtk deepin-ocr. This is a ocr tool ui."
arch=('any')
url="https://github.com/dependon/durian-ocr"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
depends=(qt5-tools
         )
makedepends=(git
            qconf
            pkgconfig
            cmake
            make)
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    #cd "${srcdir}/${pkgname%-git}"
    make -C ${srcdir}/${srcname} DESTDIR="$pkgdir" install
}
