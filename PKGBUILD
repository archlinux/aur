# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-ev
pkgver=0.26.0.0
pkgrel=1
pkgdesc='Event loop for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-ev'
license=('MPL-2.0')
depends=('hare')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('295c9888ef73abaaa2ac1fe2a6134b78b2aa391e5a4b719b029984d2edd63cfd9b10364a5bfac910ca226fa83f91c3dfdf374e7f8db8dda7ada864b15e6f8c1e')

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
