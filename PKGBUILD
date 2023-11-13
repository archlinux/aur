# Maintainer: Gaël PORTAY <gael.portay@rtone.fr>

pkgname=kernel-headers-musl-aarch64
pkgver=4.19.88
pkgrel=1
pkgdesc="Linux kernel headers sanitized for use with musl libc (aarch64)"
arch=('x86_64')
url="https://github.com/sabotage-linux/kernel-headers"
license=('LGPL')
depends=('musl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sabotage-linux/kernel-headers/archive/v${pkgver/_/-}.tar.gz")
sha512sums=('db0239c40399c89cc250b9f1f53b7ec4eb119fde6b25c503aef7e88b80694df3a5e89196a22e66376731764bac83d9120794ee6c601a95b824f1ab770cb45a61')

build() {
  cd "$srcdir"/kernel-headers-${pkgver/_/-}
  make ARCH=aarch64 prefix=/usr/aarch64-linux-gnu/lib/musl
}

package() {
  cd "$srcdir"/kernel-headers-${pkgver/_/-}
  make ARCH=aarch64 prefix=/usr/aarch64-linux-gnu/lib/musl DESTDIR="$pkgdir" install
}
