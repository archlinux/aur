# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Davide Iosca <dvdios [at] aol [dot] com>

pkgname='vkcube-git'
pkgdesc='Demo cube app for Vulkan'
pkgver=r119.0d57034
pkgrel=2
url='https://github.com/krh/vkcube'
arch=('i686' 'x86_64')
license=('MIT')
depends=('vulkan-icd-loader' 'libpng' 'mesa')
source=('git+https://github.com/krh/vkcube')
sha1sums=('SKIP')
makedepends=('git' 'vulkan-headers' 'meson' 'ninja')

pkgver() {
  cd "${srcdir}"/vkcube
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/vkcube
  meson build
  cd build
  ninja
}

package() {
  cd "${srcdir}"/vkcube
  install -dm755 "${pkgdir}"/usr/bin
  install -m755 build/vkcube "${pkgdir}"/usr/bin/vkcube
}

