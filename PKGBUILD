# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-wayland
pkgver=0.26.0.2
pkgrel=1
pkgdesc='Native Hare Wayland bindings'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-wayland'
license=('MPL-2.0')
depends=('hare')
makedepends=('hare-xml' 'pkgconf' 'wayland' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('fb0e833fd90744189c390d41615998d7c97f89419913d76716b307f305a4b0555efa5ecb524e9290b9cf95c307dc04ba146e0e053aebe24406ff205a5ba83791')

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
