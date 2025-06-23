# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-ev
pkgver=0.25.2.0
pkgrel=1
pkgdesc='Event loop for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-ev'
license=('MPL-2.0')
depends=('hare')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('5484da4c3c741f9495b380203a3cf80961e3efc03c58a088bc002325c948b9a7c759ee658c9fbaeee7d3070735814818b0e96e451196dc817dd3adec8cfecc4b')

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
