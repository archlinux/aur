# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-json
pkgver=0.25.2.0
pkgrel=1
pkgdesc='JSON support for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-json'
license=('MPL-2.0')
depends=('hare')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('e73a1fb77beb50588ec038e1ad8bf98ba56ded06ee0183d1bd2b5e5231e705ba2eaced21d7683baad99e7a77032962cedc4a07c3af78f275f2eb364685dbe952')

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
