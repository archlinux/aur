# Maintainer: Davide Iosca <dvdios [at] aol [dot] com>

pkgname='vkcube-git'
pkgdesc='Demo cube app for Vulkan'
pkgver=r39.2c68258
pkgrel=1
url='https://github.com/krh/vkcube'
arch=('i686' 'x86_64')
license=('MIT')
depends=('vulkan-icd-loader' 'libpng' 'mesa')
source=('git+https://github.com/krh/vkcube')
sha1sums=('SKIP')
makedepends=('git' 'vulkan-intel')

pkgver() {
  cd "${srcdir}"/vkcube
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/vkcube

  autoreconf -f -i -v
  ./configure --prefix=/usr
}

build() {
  cd "${srcdir}"/vkcube

  make V=1 -j2
}

package() {
  cd "${srcdir}"/vkcube

  install -dm755 "${pkgdir}"/usr/bin
  install  -m755 vkcube "${pkgdir}"/usr/bin/vkcube
}

