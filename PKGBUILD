# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-json
pkgver=0.24.2
pkgrel=1
pkgdesc='JSON support for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-json'
license=('MPL-2.0')
depends=('hare')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('5c82ceaf96ac8f01c14c718203888d354cefa17e7de862f28ddcb675a199fdaf802076abb67ec31ac299090fda3392cc527290bfa1eb7b1f745a5d8a7891b648')

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
