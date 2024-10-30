# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-ssh
pkgver=0.24.2
pkgrel=1
pkgdesc='SSH library for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-ssh'
license=('MPL-2.0')
depends=('hare')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1274b69d2ee1f2eae5ebcd2746364597d20e91693b6202eb31c1e5482426a1d2')

prepare() {
  cd "$pkgname-$pkgver"

  sed \
    -i Makefile \
    -e 's/install -m644/cp -vr/g'
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
