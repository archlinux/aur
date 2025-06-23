# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-ssh
pkgver=0.25.2
pkgrel=1
pkgdesc='SSH library for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-ssh'
license=('MPL-2.0')
depends=('hare')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('9ca8d9d245f0c4d96d2d687bab3164bbcf3fcb14d78a672bd3333d195d4ef7496393fe49c21112172ffd117437bf6e8d800ccdb7e53bf1c1e9627db0b3ad02ca')

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
