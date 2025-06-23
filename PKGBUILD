# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-http
pkgver=0.25.2.0
pkgrel=1
pkgdesc='HTTP support for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-http'
license=('MPL-2.0')
depends=('hare' 'hare-ev')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('fab598499f7ad029730a888a52415c305484160f7edc2fb5bd6b3406d1361a37a6180dbdf3aa5651417acb4c194382608d393764c31445320bec63060d3a36de')

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
