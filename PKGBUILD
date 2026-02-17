# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-json
pkgver=0.26.0.0
pkgrel=1
pkgdesc='JSON support for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-json'
license=('MPL-2.0')
depends=('hare')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('f58bd0fa8fd263fc941b7348b03c21f465fd40596f5a6348efd375fd69270521b58675511cb26c376a0d26b99c8072b5e5b1ee78add39792abe241c68531ff6b')

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
