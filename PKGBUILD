#Maintainer: Yury Bobylev <bobilev_yury@mail.ru>
pkgname="crengine-ng"
pkgver="0.9.14.1"
pkgrel="1"
conflicts=('crengine-ng-git')
pkgdesc="crengine-ng is cross-platform library designed to implement text viewers and e-book readers"
arch=('x86_64')
provides=("${pkgname}")
source=("https://gitlab.com/coolreader-ng/crengine-ng/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
url="https://gitlab.com/coolreader-ng/crengine-ng"
license=('GPL-2.0-or-later')
makedepends=('cmake' 'gcc' 'pkgconf')
depends=('freetype2' 'harfbuzz' 'zlib' 'zstd' 'libpng' 'libjpeg-turbo' 'fribidi' 'libunibreak' 'libutf8proc' 'fontconfig' 'libwebp')
sha256sums=('a270a1b578b3cdfb82e82dfefe2e47ae6ec705e53c6360fcf4d592acab0563a5')

build() {   
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_SHARED_LIBS=ON
    -D ADD_DEBUG_EXTRA_OPTS=OFF
    -D DOC_DATA_COMPRESSION_LEVEL=1
    -D DOC_BUFFER_SIZE=0x400000
    -D MAX_IMAGE_SCALE_MUL=0
    -D GRAY_BACKBUFFER_BITS=4
    -D ENABLE_LARGEFILE_SUPPORT=ON
    -D USE_COLOR_BACKBUFFER=ON
    -D USE_LOCALE_DATA=ON
    -D LDOM_USE_OWN_MEM_MAN=ON
    -D USE_GIF=ON
    -D BUILD_TOOLS=OFF
    -D ENABLE_UNITTESTING=OFF
    -D OFFLINE_BUILD_MODE=ON
    -D ENABLE_LTO=OFF
    -D USE_NANOSVG=ON
    -D USE_CHM=ON
    -D USE_ANTIWORD=ON
    -D USE_SHASUM=OFF
    -D USE_CMARK_GFM=OFF
    -D USE_MD4C=ON
    -D WITH_LIBPNG=ON
    -D WITH_LIBJPEG=ON
    -D WITH_FREETYPE=ON
    -D WITH_HARFBUZZ=ON
    -D WITH_LIBUNIBREAK=ON
    -D WITH_FRIBIDI=ON
    -D WITH_ZSTD=ON
    -D WITH_UTF8PROC=ON
    -D USE_FONTCONFIG=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build --parallel $(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
