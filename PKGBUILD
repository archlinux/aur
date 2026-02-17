# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-wayland
pkgver=0.26.0.1
pkgrel=1
pkgdesc='Native Hare Wayland bindings'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-wayland'
license=('MPL-2.0')
depends=('hare')
makedepends=('hare-xml' 'pkgconf' 'wayland' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('4e439bf2d333f8e21acd8d3e23fdc66cc1cfbf9a0a0035adb72893cd080e17e37d2870844118f1835d4afdb9868b9c1264514570b93df5f3e2f1c35f600e2405')

build() {
  cd "$pkgname-$pkgver"

  # remove '-Wl,' prefix if present, since it is only required when
  # the linker is invoked indirectly. Keeping it will cause the linker to
  # fail.
  export LDFLAGS=${LDFLAGS#"-Wl,"}

  make all
}

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
