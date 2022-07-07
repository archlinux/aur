# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=yamagi-quake2-ref_vk-git
pkgver=1.0.2.r8.g649279b
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Vulkan renderer for yamagi-quake2 (development version)"
url="https://github.com/yquake2/ref_vk/"
license=('GPL' 'custom')
depends=('yamagi-quake2')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=(${pkgname%-*}::"git+https://github.com/yquake2/ref_vk.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  make -C ${pkgname%-*}
}

package() {
  cd ${pkgname%-*}

  # library
  install -Dm644 -t "$pkgdir"/usr/lib/yamagi-quake2 release/ref_vk.so

  # doc
  install -Dm644 -t "$pkgdir"/usr/share/doc/${pkgname%-*} README.md

  # license
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
