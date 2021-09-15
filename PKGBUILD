# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=hvif-git
pkgver=0.1.0.r0.g2193c3e
pkgrel=1
pkgdesc='HVIF implementation for Linux'
arch=('x86_64')
url='https://linkmauve.fr/dev/hvif/'
license=('MPL2')
depends=('gdk-pixbuf2')
makedepends=('git' 'cargo')
provides=('hvif')
conflicts=('hvif')
source=('git+https://git.linkmauve.fr/hvif.git')
sha256sums=('SKIP')

pkgver() {
  cd hvif
  git describe --tags --long | sed 's/^v//; s/_/./g; s/-/.r/; s/-/./'
}

build() {
  cd hvif
  arch-meson build
  ninja -C build
}

check() {
  cd hvif
  cargo test --release \
    --target-dir build
}

package() {
  cd hvif
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}

# vim:set ts=2 sw=2 et:
