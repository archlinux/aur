# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=qeh-git
pkgver=r41.41f1f40
pkgrel=1
pkgdesc='Very simple and fast image viewer'
arch=('i686' 'x86_64')
url='https://github.com/sandsmark/qeh'
license=('GPL')
depends=('qt5-base' 'qt5-x11extras')
makedepends=('cmake' 'git')
conflicts=(qeh)
provides=(qeh)
source=('git+https://github.com/sandsmark/qeh.git')
optdepends=(
    'kimageformats: Support for Windows cursors, AVIF, EPS, OpenEXR, Radiance HDR, HEIF, Krita, OpenRaster, Gimp, pic, Photoshop, SunOS raster, SGI RGB, Targa'
    'qt-ffmpeg-imageplugin-git: Support for webm, avif, apng, flic and more'
    'qt5-imageformats: Support for WebP, JPEG 2000, Targa, TIFF, Wireless Bitmap, MNG, DirectX textures, Apple icons'
    'qvtf-git: Support for Valve Texture Files'
    'qt5-jpegxl-image-plugin: Support for JPEG XL'
    'qt5-apng-plugin: Support for Animated PNG'
    'qt5-avif-image-plugin: Alternative to kimageformats for AVIF support'
    'qt5-pbfimageplugin: Support for Mapbox vector tiles'
    'extra-imageformats-qt: Support for BPG, FUIF and PGF'
    'qtraw: Support for RAW files via libraw'
    )
md5sums=('SKIP')

pkgver() {
  cd qeh
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../qeh \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -vDm 644 ../qeh/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
