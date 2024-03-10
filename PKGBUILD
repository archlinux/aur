# Maintainer: Kaito Udagawa <umireon at gmail dot com>
pkgname=obs-ocr

pkgver=0.0.5
pkgrel=1
pkgdesc='OCR Plugin for OBS based on Tesseract'
_source="${pkgname}-${pkgver}"

arch=(x86_64)
url='https://github.com/occ-ai/obs-ocr'
license=('GPL2')
depends=('obs-studio' 'opencv' 'curl' 'tesseract')
makedepends=('cmake')
source=("${_source}.tar.xz::$url/releases/download/${pkgver}/${pkgname}-${pkgver}-source.tar.xz")
sha256sums=('00cc82b6828227b1a7d34b65c64de7e3b37cccd4504e15745cabcabbe0f3ab11')

build() {
  cmake -B build -S "$_source-source" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DENABLE_FRONTEND_API=ON -DENABLE_QT=ON -DUSE_SYSTEM_OPENCV=ON -DUSE_SYSTEM_TESSERACT=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

