# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=deepin-ocr-git
pkgver=r86.1d17781
pkgrel=1
pkgdesc='deepin OCR Tool'
arch=('x86_64' 'aarch64')
url='https://github.com/linuxdeepin/deepin-ocr/'
license=('MIT')
depends=(
    'opencv'
    'ncnn'
)
makedepends=(
    'git'
    'qt5-tools'
    'cmake'
)
optdepends=(
)
source=(
    'git+https://github.com/linuxdeepin/deepin-ocr.git'
    'be2eff7360e74ba4062e4c6a1f3328b5be1594c2.diff'
)
md5sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd ${srcdir}/deepin-ocr

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd ${srcdir}/deepin-ocr
    git apply ${srcdir}/be2eff7360e74ba4062e4c6a1f3328b5be1594c2.diff
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    make -C ${srcdir}/deepin-ocr DESTDIR="$pkgdir" install
    cd ${srcdir}/deepin-ocr
    mkdir -p ${pkgdir}/usr/share/licenses/deepin-ocr-git
    install ./LICENSE ${pkgdir}/usr/share/licenses/deepin-ocr-git/LICENSE
}
