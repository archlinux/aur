# Maintainer: Remisa Phillips <remisa.yousefvand@gmail.com>
pkgname=metadata
pkgver=0.2.0
pkgrel=1
pkgdesc='Qt 6 application for viewing, editing, copying, exporting, and removing file metadata'
arch=('x86_64')
url='https://github.com/yousefvand/metadata'
license=('MIT')
depends=('qt6-base' 'perl-image-exiftool' 'qpdf' 'hicolor-icon-theme')
optdepends=('dolphin: Show Metadata file-manager context-menu integration')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4ba396a76dce6a40599af80abeb969aad7c5cc6b65a9e5d075c54d825dc4b4d7')

build() {
    cmake -S "metadata-${pkgver}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_DOLPHIN_SERVICE_MENU=ON
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
