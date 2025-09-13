# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libbluray-git
pkgver=1.4.0.7.gd41111c1
pkgrel=1
pkgdesc='Library to access Blu-Ray disks for video playback. (GIT version)'
arch=('x86_64')
license=('LGPL2.1')
url='https://www.videolan.org/developers/libbluray.html'
depends=(
  'libxml2'
  'fontconfig'
  'freetype2'
  'libudfread'
  'glibc' # libc.so
)
makedepends=(
  'git'
  'apache-ant'
  'java-environment'
)
optdepends=(
  'libaacs: Enable AACS decryption'
  'java-runtime: BD-J library'
)
provides=(
  'libbluray'
  'libbluray.so'
)
conflicts=('libbluray')
source=('git+https://code.videolan.org/videolan/libbluray.git')
sha256sums=('SKIP')

pkgver() {
  cd libbluray
  echo "$(git describe --long --tags | tr - .)"
}

build() {
 arch-meson libbluray build \
    -D embed_udfread=false -D enable_tools=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  make
}

package() {
  depends+=(
    'libxml2.so'
    'libfontconfig.so'
    'libfreetype.so'
    'libudfread.so'
  )

  DESTDIR="${pkgdir}" meson install -C build
}
