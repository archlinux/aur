# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-ssh
pkgver=0.26.0
pkgrel=1
pkgdesc='SSH library for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-ssh'
license=('MPL-2.0')
depends=('hare')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('fe392d75b78e8a4626da37baee532dc37e8472e87f6edaf26fb88a75d7dac3ada57f50441aa58c1d4b18bdcc5ee6fbb7079742508128f4e313598a257adc7438')

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
