# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libudfread-git
pkgver=1.2.0.3.g139a219
pkgrel=1
pkgdesc='UDF reader. (GIT version)'
arch=('x86_64')
license=('LGPL2.1')
url='https://git.videolan.org/?p=libudfread.git;a=summary'
depends=('glibc')
makedepends=(
  'meson'
  'ninja'
  'git'
)
provides=(
  'libudfread'
  'libudfread.so'
)
conflicts=('libudfread')
source=('git+https://code.videolan.org/videolan/libudfread.git')
sha256sums=('SKIP')

pkgver() {
  cd libudfread
  echo "$(git describe --long --tags | tr - .)"
}

build() {
 arch-meson libudfread build \
    --libexec=lib
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
