# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-wayland
pkgver=0.25.2.0
pkgrel=1
pkgdesc='Native Hare Wayland bindings'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-wayland'
license=('MPL-2.0')
depends=('hare')
makedepends=('hare-xml' 'pkgconf' 'wayland' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('bd2976bfb276b047b14946fe0820d7a0d8c610a2dbdd6492040a1e07fdfee7d5c76f7028bd35c82fab254a6f303b93a712a1dce0ea4546c2ac1b1f21e896540c')

check() {
  cd "$pkgname-$pkgver"

  # remove '-Wl,' prefix if present, since it is only required when
  # the linker is invoked indirectly. Keeping it will cause the linker to
  # fail.
  export LDFLAGS=${LDFLAGS#"-Wl,"}

  make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
