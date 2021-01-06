# Maintainer: ahub <ahub@riseup.net>

pkgname=qrop
pkgver=0.4.5
pkgrel=1
pkgdesc="Crop planning and recordkeeping software for and by market gardeners." arch=("x86_64")
url="https://qrop.frama.io/"
license=("GPL3")
depends=("qt5-base" "qt5-charts" "qt5-quickcontrols2" "qt5-tools")
makedepends=("make" "cmake" "sqlite")

source=("https://framagit.org/ah/qrop/-/archive/v${pkgver}/${pkgname}-v$pkgver.tar.gz"
  "qrop.desktop::https://framagit.org/-/snippets/6043/raw/main/snippetfile1.txt")

sha256sums=("7ac9faa9bc7f16e098fa452c51643ec8d3f3ecb2f23dde90e9b9507952cd6077"
  "0659fd27c86e86e62bce66525e0c738c2975f28c68faf18d696634a0e59c88fd")

build() {
# TODO : Remove Release flag as per https://wiki.archlinux.org/index.php/CMake_package_guidelines
  cmake -B build -S "${pkgname}-v${pkgver}" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev 
  make -C build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm755 "${srcdir}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/qrop.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/build/core/libcore.so" "${pkgdir}/usr/lib/libcore.so"
  install -Dm644 "${srcdir}/qrop-v${pkgver}/logo.png" "${pkgdir}/usr/share/icons/hicolor/256x256/qrop.png"
}
