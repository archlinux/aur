# Maintainer: Sergey Slipchenko <faergeek@gmail.com>
pkgname=plymouth-lite-rbp-git
pkgver=r10.76e20e8
pkgrel=3
pkgdesc="Plymouth-lite patched and ready for Raspberry Pi"
arch=('armv7h')
url="https://github.com/T4d3o/Plymouth-lite"
license=('GPL2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/T4d3o/Plymouth-lite.git'
        'initcpio_hook'
        'initcpio_install')
md5sums=('SKIP'
         '86dcab222ab4be45fc96d2792ff91809'
         '4e9d360bbd7b14e097401e7b83f7b682')

pkgver() {
  cd Plymouth-lite

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd Plymouth-lite

  make
}

package() {
  cd Plymouth-lite

  make DESTDIR="$pkgdir/" install
  install -Dm0644 "${srcdir}"/initcpio_hook "${pkgdir}"/usr/lib/initcpio/hooks/plymouth-lite
  install -Dm0644 "${srcdir}"/initcpio_install "${pkgdir}"/usr/lib/initcpio/install/plymouth-lite
}
